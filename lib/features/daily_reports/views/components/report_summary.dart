// lib/features/daily_reports/views/components/report_summary.dart
import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/features/daily_reports/providers/daily_report_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReportSummary extends ConsumerWidget {
  final DailyReports report;

  const ReportSummary({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 日報に紐づくプロジェクト一覧を取得
    final projectsAsync = ref.watch(dailyReportProjectsProvider(report.docId));

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 日付
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  report.date != null
                      ? DateFormat('yyyy年MM月dd日(E)', 'ja').format(report.date!)
                      : '日付なし',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // 承認状態タグ
                _buildStatusTag(report),
              ],
            ),

            const Divider(height: 24),

            // プロジェクト作業時間
            projectsAsync.when(
              data: (projects) {
                if (projects.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'プロジェクト作業なし',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }

                final totalHours =
                    ref.watch(dailyReportTotalHoursProvider(projects));

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('プロジェクト作業時間'),
                    Text(
                      '$totalHours 時間',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
              loading: () => const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              error: (_, __) => const Text('プロジェクト情報の取得に失敗しました'),
            ),

            // 休暇情報
            if (report.holidays.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...report.holidays.entries
                  .where((e) => e.value > 0)
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.key),
                            Text(
                              '${e.value} 時間',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
            ],

            // 欠勤・早退
            if (report.absentOrLeft > 0) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('欠勤・早退'),
                  Text(
                    '${report.absentOrLeft} 時間',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],

            // 代休情報
            if (report.hasSubstituteHoliday == true) ...[
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('代休取得'),
                  Icon(Icons.check, color: Colors.green),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTag(DailyReports report) {
    // 承認状態に応じた色とテキスト
    Color color;
    String text;

    if (report.isApproval == true) {
      color = Colors.green;
      text = '承認済';
    } else if (report.isApproval == false) {
      color = Colors.orange;
      text = '未承認';
    } else {
      color = Colors.grey;
      text = '下書き';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
