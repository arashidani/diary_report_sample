// lib/features/daily_reports/views/daily_report_detail_page.dart
import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:diary_report_sample/features/daily_reports/viewmodels/reports_providers.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/daily_report_project_list.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/project_selector.dart';
import 'package:diary_report_sample/features/daily_reports/views/components/report_edit_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DailyReportDetailPage extends ConsumerWidget {
  final String reportId;

  const DailyReportDetailPage({
    Key? key,
    required this.reportId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(singleReportProvider(reportId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('日報詳細'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              if (reportAsync.valueOrNull != null) {
                _showEditSheet(context, reportAsync.value);
              }
            },
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
        error: (error, _) => Center(
          child: Text('エラーが発生しました: $error'),
        ),
      ),
      floatingActionButton: reportAsync.hasValue && reportAsync.value != null
          ? FloatingActionButton(
              onPressed: () => _showProjectSelector(context),
              child: const Icon(Icons.add),
              tooltip: 'プロジェクト追加',
            )
          : null,
    );
  }

  Widget _buildReportDetail(BuildContext context, DailyReports report) {
    final dateFormatter = DateFormat('yyyy年MM月dd日(E)', 'ja');
    final dateStr =
        report.date != null ? dateFormatter.format(report.date!) : '日付なし';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 日報ヘッダー
        Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dateStr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildStatusChip(report),
                    ],
                  ),
                  if (report.absentOrLeft > 0) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.event_busy,
                            color: Colors.red, size: 16),
                        const SizedBox(width: 4),
                        Text('欠勤・早退: ${report.absentOrLeft}時間'),
                      ],
                    ),
                  ],
                  if (report.holidays.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    const Text('休暇情報:'),
                    const SizedBox(height: 4),
                    ...report.holidays.entries
                        .where((e) => e.value > 0)
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(left: 16, top: 2),
                              child: Text('${e.key}: ${e.value}時間'),
                            )),
                  ],
                  if (report.hasSubstituteHoliday == true) ...[
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Icon(Icons.event_available,
                            color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text('代休取得'),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),

        // プロジェクトタイトル
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'プロジェクト作業',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // プロジェクトリスト
        Expanded(
          child: DailyReportProjectList(reportId: reportId),
        ),
      ],
    );
  }

  Widget _buildStatusChip(DailyReports report) {
    Color color;
    String text;
    IconData icon;

    if (report.isApproval == true) {
      color = Colors.green;
      text = '承認済';
      icon = Icons.check_circle;
    } else if (report.isApproval == false) {
      color = Colors.orange;
      text = '未承認';
      icon = Icons.pending_actions;
    } else {
      color = Colors.grey;
      text = '下書き';
      icon = Icons.edit_note;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditSheet(BuildContext context, DailyReports? report) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
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

  void _showProjectSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ProjectSelector(reportId: reportId),
    );
  }
}
