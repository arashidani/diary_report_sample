import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReportsEditSheet extends ConsumerStatefulWidget {
  final String? docId;
  final DailyReports? initialReport;

  const ReportsEditSheet({
    super.key,
    this.docId,
    this.initialReport,
  });

  @override
  ConsumerState<ReportsEditSheet> createState() => _ReportsEditSheetState();
}

class _ReportsEditSheetState extends ConsumerState<ReportsEditSheet> {
  late DateTime _selectedDate;
  bool _isApproval = false;
  bool _hasSubstituteHoliday = false;
  double _absentOrLeft = 0.0;

  // 休暇種別と時間のマップ
  final Map<String, double> _holidays = {};

  // 休暇種別のリスト
  final List<String> _holidayTypes = [
    '年次有給休暇',
    '特別休暇',
    '代休',
    'その他',
  ];

  @override
  void initState() {
    super.initState();

    // 初期値の設定
    if (widget.initialReport != null) {
      _selectedDate = widget.initialReport!.date ?? DateTime.now();
      _isApproval = widget.initialReport!.isApproval ?? false;
      _hasSubstituteHoliday =
          widget.initialReport!.hasSubstituteHoliday ?? false;
      _absentOrLeft = widget.initialReport!.absentOrLeft;

      // 休暇マップの初期化
      _holidays.addAll(widget.initialReport!.holidays);
    } else {
      _selectedDate = DateTime.now();
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 30)), // 30日先まで選択可能
      locale: const Locale('ja'), // 日本語ロケールを使用
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _saveReport() async {
    try {
      final userId = ref.read(authStateProvider).value?.uid;
      if (userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ユーザー情報が取得できませんでした')),
        );
        return;
      }

      final reportData = {
        'date': _selectedDate,
        'isApproval': _isApproval,
        'hasSubstituteHoliday': _hasSubstituteHoliday,
        'absentOrLeft': _absentOrLeft,
        'holidays': _holidays,
        'updatedAt': DateTime.now(),
      };

      // 新規作成の場合は createdAt も追加
      if (widget.docId == null) {
        reportData['createdAt'] = DateTime.now();
      }

      final reportsRef =
          FirebaseFirestore.instance.collection('users/$userId/dailyReports');

      if (widget.docId != null) {
        // 更新
        await reportsRef.doc(widget.docId).update(reportData);
      } else {
        // 新規作成
        await reportsRef.add(reportData);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('日報を保存しました')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('エラーが発生しました: $e')),
      );
    }
  }

  // 休暇時間の入力ダイアログを表示
  Future<void> _showHolidayTimeDialog(String holidayType) async {
    final controller = TextEditingController(
      text: _holidays[holidayType]?.toString() ?? '',
    );

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$holidayTypeの時間'),
          content: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: '時間 (例: 8.0)',
              suffixText: '時間',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('キャンセル'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                final value = double.tryParse(controller.text);
                if (value != null) {
                  setState(() {
                    _holidays[holidayType] = value;
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.docId != null;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isEditing ? '日報を編集' : '新規日報登録',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          // 日付選択
          ListTile(
            title: const Text('日付'),
            subtitle:
                Text(DateFormat('yyyy年MM月dd日(E)', 'ja').format(_selectedDate)),
            trailing: const Icon(Icons.calendar_today),
            onTap: _pickDate,
          ),

          const Divider(),

          // 承認状態
          SwitchListTile(
            title: const Text('承認状態'),
            subtitle: Text(_isApproval ? '承認済み' : '未承認'),
            value: _isApproval,
            onChanged: (value) {
              setState(() {
                _isApproval = value;
              });
            },
          ),

          // 代休取得有無
          SwitchListTile(
            title: const Text('代休取得'),
            value: _hasSubstituteHoliday,
            onChanged: (value) {
              setState(() {
                _hasSubstituteHoliday = value;
              });
            },
          ),

          // 欠勤・早退時間
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text('欠勤・早退時間'),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    initialValue: _absentOrLeft.toString(),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      suffixText: '時間',
                      isDense: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _absentOrLeft = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // 休暇設定
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text('休暇設定', style: TextStyle(fontWeight: FontWeight.bold)),
          ),

          ...List.generate(_holidayTypes.length, (index) {
            final type = _holidayTypes[index];
            final hours = _holidays[type] ?? 0.0;

            return ListTile(
              title: Text(type),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$hours時間'),
                  const SizedBox(width: 8),
                  const Icon(Icons.edit),
                ],
              ),
              onTap: () => _showHolidayTimeDialog(type),
            );
          }),

          const SizedBox(height: 16),

          // 保存ボタン
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saveReport,
              child: Text(isEditing ? '更新する' : '登録する'),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
