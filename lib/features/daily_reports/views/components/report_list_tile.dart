import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/report_edit_sheet.dart';
import 'package:diary_report_sample/features/daily_reports/views/report_detail_page.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ReportListTile extends ConsumerWidget {
  final String docId;
  final DailyReports dailyReports;

  const ReportListTile({
    super.key,
    required this.docId,
    required this.dailyReports,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 日付フォーマット
    final dateStr = dailyReports.date != null
        ? DateFormat('MM/dd (E)', 'ja').format(dailyReports.date!)
        : '日付なし';

    // 承認状態に基づく表示色
    final statusColor = dailyReports.isApproval == true
        ? Colors.green
        : (dailyReports.isApproval == false ? Colors.orange : Colors.grey);

    return Dismissible(
      key: Key(docId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        // 削除確認ダイアログを表示
        final result = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('日報を削除'),
            content: Text('${dateStr}の日報を削除しますか？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('キャンセル'),
              ),
              TextButton(
                onPressed: () => context.pop(true),
                child: const Text('削除'),
              ),
            ],
          ),
        );

        // nullable boolを返すのではなく、明示的にfalseを返す
        return result ?? false;
      },
      onDismissed: (_) async {
        try {
          final userId = ref.read(authStateProvider).value?.uid;
          if (userId != null) {
            await FirebaseFirestore.instance
                .collection('users/$userId/dailyReports')
                .doc(docId)
                .delete();

            // 削除成功メッセージを表示
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${dateStr}の日報を削除しました')),
              );
            }
          }
        } catch (e) {
          // エラーが発生した場合、かつcontextがまだ有効な場合にスナックバーを表示
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('削除中にエラーが発生しました: $e')),
            );
          }
        }
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.2),
          child: Icon(
            dailyReports.isApproval == true
                ? Icons.check_circle
                : Icons.pending_actions,
            color: statusColor,
          ),
        ),
        title: Row(
          children: [
            Text(
              dateStr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            // 承認状態を示すタグ
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: statusColor.withOpacity(0.5)),
              ),
              child: Text(
                dailyReports.isApproval == true
                    ? '承認済'
                    : (dailyReports.isApproval == false ? '未承認' : '下書き'),
                style: TextStyle(
                  fontSize: 12,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
        subtitle: _buildSubtitle(dailyReports),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ReportsEditSheet(
                docId: docId,
                initialReport: dailyReports,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubtitle(DailyReports report) {
    final List<String> details = [];

    // 欠勤・早退
    if (report.absentOrLeft > 0) {
      details.add('欠勤・早退: ${report.absentOrLeft}時間');
    }

    // 休暇情報
    if (report.holidays.isNotEmpty) {
      final holidayDetails = report.holidays.entries
          .where((entry) => entry.value > 0)
          .map((entry) => '${entry.key}: ${entry.value}時間')
          .join(', ');

      if (holidayDetails.isNotEmpty) {
        details.add(holidayDetails);
      }
    }

    // 代休
    if (report.hasSubstituteHoliday == true) {
      details.add('代休取得');
    }

    return Text(details.isNotEmpty ? details.join(' / ') : '詳細なし');
  }
}
