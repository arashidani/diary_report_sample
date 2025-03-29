import 'package:diary_report_sample/features/daily_reports/models/daily_reports.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HolidayPieChart extends StatelessWidget {
  final List<DailyReports> reports;

  const HolidayPieChart({
    Key? key,
    required this.reports,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 休暇種別ごとの合計時間を計算
    final Map<String, double> holidayTotals = {};
    double totalHours = 0;

    for (final report in reports) {
      report.holidays.forEach((type, hours) {
        if (hours > 0) {
          holidayTotals[type] = (holidayTotals[type] ?? 0) + hours;
          totalHours += hours;
        }
      });
    }

    // 休暇取得がない場合
    if (totalHours == 0) {
      return const SizedBox.shrink();
    }

    // 円グラフに使用する色のリスト
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
    ];

    // 円グラフのセクションデータを作成
    final sections = <PieChartSectionData>[];
    int colorIndex = 0;

    holidayTotals.forEach((type, hours) {
      final percentage = (hours / totalHours) * 100;
      sections.add(
        PieChartSectionData(
          color: colors[colorIndex % colors.length],
          value: hours,
          title: '${percentage.toStringAsFixed(1)}%',
          radius: 50,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
      colorIndex++;
    });

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '休暇取得内訳',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 30,
                        sections: sections,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          holidayTotals.length,
                          (index) {
                            final entry =
                                holidayTotals.entries.elementAt(index);
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: colors[index % colors.length],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      entry.key,
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    '${entry.value}h',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const Divider(),
                        Row(
                          children: [
                            const Text(
                              '合計',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              '${totalHours}h',
                              style: const TextStyle(
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
          ],
        ),
      ),
    );
  }
}
