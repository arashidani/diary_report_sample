import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:flutter/material.dart';

class MonthlySummary extends StatelessWidget {
  final List<DailyReports> reports;

  const MonthlySummary({
    Key? key,
    required this.reports,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 件数が0の場合は表示しない
    if (reports.isEmpty) {
      return const SizedBox.shrink();
    }

    // サマリー情報を計算
    final totalReports = reports.length;
    final approvedReports = reports.where((r) => r.isApproval == true).length;
    final pendingReports = reports.where((r) => r.isApproval == false).length;
    final draftReports = reports.where((r) => r.isApproval == null).length;

    // 休暇時間の合計を計算
    double totalHolidayHours = 0;
    for (final report in reports) {
      report.holidays.forEach((_, hours) {
        totalHolidayHours += hours;
      });
    }

    // 欠勤・早退時間の合計
    final totalAbsentHours = reports.fold<double>(
      0,
      (sum, report) => sum + (report.absentOrLeft),
    );

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '月間サマリー',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildSummaryItem(
                  context,
                  Icons.fact_check,
                  '$totalReports件',
                  '合計',
                  Colors.blue,
                ),
                _buildSummaryItem(
                  context,
                  Icons.check_circle,
                  '$approvedReports件',
                  '承認済',
                  Colors.green,
                ),
                _buildSummaryItem(
                  context,
                  Icons.pending_actions,
                  '$pendingReports件',
                  '未承認',
                  Colors.orange,
                ),
                _buildSummaryItem(
                  context,
                  Icons.edit_note,
                  '$draftReports件',
                  '下書き',
                  Colors.grey,
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                _buildHoursSummary(
                  context,
                  Icons.event_busy,
                  '${totalAbsentHours.toStringAsFixed(1)}時間',
                  '欠勤・早退',
                  Colors.red.shade300,
                ),
                _buildHoursSummary(
                  context,
                  Icons.event_available,
                  '${totalHolidayHours.toStringAsFixed(1)}時間',
                  '休暇取得',
                  Colors.green.shade300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoursSummary(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
