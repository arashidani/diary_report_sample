// lib/features/daily_reports/views/components/project_selector.dart
import 'package:diary_report_sample/features/daily_reports/models/daily_report_project.dart';
import 'package:diary_report_sample/features/daily_reports/providers/daily_report_project_notifier.dart';
import 'package:diary_report_sample/features/daily_reports/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectSelector extends ConsumerStatefulWidget {
  final String reportId;

  const ProjectSelector({
    Key? key,
    required this.reportId,
  }) : super(key: key);

  @override
  ConsumerState<ProjectSelector> createState() => _ProjectSelectorState();
}

class _ProjectSelectorState extends ConsumerState<ProjectSelector> {
  String? _selectedProjectId;
  final _businessController = TextEditingController(text: '0.0');
  final _overController = TextEditingController(text: '0.0');
  final _lateController = TextEditingController(text: '0.0');

  @override
  void dispose() {
    _businessController.dispose();
    _overController.dispose();
    _lateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProjectsAsync = ref.watch(userProjectsWithDetailsProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'プロジェクト追加',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // プロジェクト選択
            userProjectsAsync.when(
              data: (projects) {
                if (projects.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Text('登録されているプロジェクトがありません'),
                    ),
                  );
                }

                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'プロジェクト',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedProjectId,
                  hint: const Text('プロジェクトを選択'),
                  items: projects.map((project) {
                    return DropdownMenuItem<String>(
                      value: project.docId,
                      child: Text(project.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedProjectId = value;
                    });
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Text('エラーが発生しました: $error'),
              ),
            ),

            const SizedBox(height: 16),

            // 通常時間
            TextField(
              controller: _businessController,
              decoration: const InputDecoration(
                labelText: '通常時間',
                suffix: Text('時間'),
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),

            const SizedBox(height: 16),

            // 残業時間
            TextField(
              controller: _overController,
              decoration: const InputDecoration(
                labelText: '残業時間',
                suffix: Text('時間'),
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),

            const SizedBox(height: 16),

            // 深夜時間
            TextField(
              controller: _lateController,
              decoration: const InputDecoration(
                labelText: '深夜時間',
                suffix: Text('時間'),
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),

            const SizedBox(height: 24),

            // 登録ボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedProjectId == null ? null : _addProject,
                child: const Text('追加する'),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _addProject() {
    if (_selectedProjectId == null) return;

    // 入力値の取得とバリデーション
    final business = double.tryParse(_businessController.text) ?? 0.0;
    final over = double.tryParse(_overController.text) ?? 0.0;
    final late = double.tryParse(_lateController.text) ?? 0.0;

    // すべて0の場合はエラー
    if (business == 0.0 && over == 0.0 && late == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('少なくとも1つの時間を入力してください')),
      );
      return;
    }

    // プロジェクトの作成
    final project = DailyReportProject(
      docId: _selectedProjectId!,
      business: business,
      over: over,
      late: late,
      createdAt: DateTime.now(),
    );

    // 登録処理
    final notifier =
        ref.read(dailyReportProjectNotifierProvider(widget.reportId).notifier);
    notifier.addProject(project).then((_) {
      Navigator.of(context).pop();
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('エラーが発生しました: $e')),
      );
    });
  }
}
