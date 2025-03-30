import 'package:diary_report_sample/features/daily_reports/models/user_project.dart';
import 'package:diary_report_sample/features/daily_reports/providers/project_provider.dart';
import 'package:diary_report_sample/features/daily_reports/repositories/project_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 日報操作の状態を管理するNotifier
class ReportsNotifier extends AsyncNotifier<void> {
  late final ProjectRepository _repository;

  @override
  Future<void> build() async {
    _repository = ref.read(projectRepositoryProvider);
  }

  /// 日報を削除
  Future<void> deleteDailyReport(String reportId) async {
    state = const AsyncValue.loading();

    try {
      await _repository.deleteProject(reportId);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// 日報を作成
  Future<void> createDailyReport(UserProject report) async {
    state = const AsyncValue.loading();

    try {
      await _repository.create(report);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// 日報を更新
  Future<void> updateDailyReport(UserProject report) async {
    state = const AsyncValue.loading();

    try {
      await _repository.update(report);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
