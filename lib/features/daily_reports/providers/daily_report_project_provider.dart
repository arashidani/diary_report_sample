import 'package:diary_report_sample/features/daily_reports/models/daily_report_project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 日報のプロジェクトから計算された合計時間を提供する Provider
final dailyReportTotalHoursProvider = Provider.autoDispose
    .family<double, List<DailyReportProject>>((ref, projects) {
  double total = 0.0;

  for (final project in projects) {
    total += project.business + project.late + project.over;
  }

  return total;
});
