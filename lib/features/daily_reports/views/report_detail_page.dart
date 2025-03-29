import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'components/report_edit_sheet.dart';

class ReportDetailPage extends ConsumerWidget {
  final String reportId;

  const ReportDetailPage({
    Key? key,
    required this.reportId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(singleReportProvider(reportId));

    return PopScope(
        // PopScopeを正しく使用
        canPop: Navigator.of(context).canPop(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('日報詳細'),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showEditSheet(context, reportAsync.value),
              ),
            ],
          ),
          body: reportAsync.when(
            data: (report) {
              if (report == null) {
                return const Center(
                  child: Text('日報が見つかりませんでした'),
                );
              }
              return _buildReportDetail(context, report);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Text('エラーが発生しました: $error'),
            ),
          ),
        ));
  }

  Widget _buildReportDetail(BuildContext context, DailyReports report) {
    // 日付フォーマット
    final dateFormatter = DateFormat('yyyy年MM月dd日(E)', 'ja');
    final dateStr =
        report.date != null ? dateFormatter.format(report.date!) : '日付なし';

    // 状態に基づく色
    final statusColor = report.isApproval == true
        ? Colors.green
        : (report.isApproval == false ? Colors.orange : Colors.grey);

    // 状態テキスト
    final statusText = report.isApproval == true
        ? '承認済み'
        : (report.isApproval == false ? '未承認' : '下書き');

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 日付と状態
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 36),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateStr,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                report.isApproval == true
                                    ? Icons.check_circle
                                    : Icons.pending_actions,
                                color: statusColor,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                statusText,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 欠勤・早退情報
            if (report.absentOrLeft > 0)
              _buildInfoCard(
                title: '欠勤・早退',
                icon: Icons.event_busy,
                color: Colors.red.shade300,
                child: Text(
                  '${report.absentOrLeft} 時間',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // 代休取得情報
            if (report.hasSubstituteHoliday == true)
              _buildInfoCard(
                title: '代休取得',
                icon: Icons.event_available,
                color: Colors.blue.shade300,
                child: const Text(
                  '取得あり',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // 休暇取得情報
            if (report.holidays.isNotEmpty) _buildHolidaysCard(report.holidays),

            const SizedBox(height: 16),

            // 更新・作成情報
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '管理情報',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (report.createdAt != null)
                      ListTile(
                        dense: true,
                        title: const Text('作成日時'),
                        subtitle: Text(
                          DateFormat('yyyy/MM/dd HH:mm').format(
                            report.createdAt!,
                          ),
                        ),
                      ),
                    if (report.updatedAt != null)
                      ListTile(
                        dense: true,
                        title: const Text('更新日時'),
                        subtitle: Text(
                          DateFormat('yyyy/MM/dd HH:mm').format(
                            report.updatedAt!,
                          ),
                        ),
                      ),
                    ListTile(
                      dense: true,
                      title: const Text('ドキュメントID'),
                      subtitle: Text(report.docId),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  child,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHolidaysCard(Map<String, double> holidays) {
    final holidayEntries = holidays.entries.where((e) => e.value > 0).toList();
    if (holidayEntries.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.event_available, size: 24, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  '休暇取得',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...holidayEntries.map((entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key),
                      Text(
                        '${entry.value} 時間',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '合計',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${holidayEntries.fold<double>(0, (sum, e) => sum + e.value)} 時間',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showEditSheet(BuildContext context, DailyReports? report) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ReportsEditSheet(
          docId: reportId,
          initialReport: report,
        ),
      ),
    );
  }
}
