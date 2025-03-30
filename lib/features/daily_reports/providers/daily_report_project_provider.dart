// lib/features/daily_reports/providers/daily_report_project_provider.dart
import 'package:diary_report_sample/features/daily_reports/models/daily_report_project.dart';
import 'package:diary_report_sample/features/daily_reports/repositories/daily_report_project_repository.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/firestore_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// DailyReportProjectRepository Provider
final dailyReportProjectRepositoryProvider = Provider.autoDispose
    .family<DailyReportProjectRepository?, String>((ref, userId) {
  if (userId.isEmpty) return null;
  final firestoreClient = ref.watch(firestoreClientProvider);
  return DailyReportProjectRepository(firestoreClient, userId);
});

// 特定の日報に紐づく全プロジェクト情報を取得する Provider
final dailyReportProjectsProvider = StreamProvider.autoDispose
    .family<List<DailyReportProject>, String>((ref, reportId) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return Stream.value([]);

  final repository = ref.watch(dailyReportProjectRepositoryProvider(user.uid));
  if (repository == null) return Stream.value([]);

  return repository.watchDailyReportProjects(reportId);
});

// 日報のプロジェクトから計算された合計時間を提供する Provider
final dailyReportTotalHoursProvider = Provider.autoDispose
    .family<double, List<DailyReportProject>>((ref, projects) {
  double total = 0.0;

  for (final project in projects) {
    total += project.business + project.late + project.over;
  }

  return total;
});
