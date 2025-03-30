// lib/features/daily_reports/providers/daily_report_project_notifier.dart
import 'package:diary_report_sample/features/daily_reports/models/daily_report_project.dart';
import 'package:diary_report_sample/features/daily_reports/providers/daily_report_project_provider.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 日報プロジェクト操作用のNotifier
class DailyReportProjectNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;
  final String _reportId;

  DailyReportProjectNotifier(this._ref, this._reportId)
      : super(const AsyncValue.data(null));

  Future<void> addProject(DailyReportProject project) async {
    state = const AsyncValue.loading();

    try {
      final user = _ref.read(authStateProvider).value;
      if (user == null) {
        state = const AsyncValue.error('ユーザーが認証されていません', StackTrace.empty);
        return;
      }

      final repository =
          _ref.read(dailyReportProjectRepositoryProvider(user.uid));
      if (repository == null) {
        state = const AsyncValue.error('リポジトリが初期化されていません', StackTrace.empty);
        return;
      }

      // 作成日時を設定
      final newProject = project.copyWith(createdAt: DateTime.now());

      await repository.createDailyReportProject(
        reportId: _reportId,
        project: newProject,
      );

      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> updateProject(DailyReportProject project) async {
    state = const AsyncValue.loading();

    try {
      final user = _ref.read(authStateProvider).value;
      if (user == null) {
        state = const AsyncValue.error('ユーザーが認証されていません', StackTrace.empty);
        return;
      }

      final repository =
          _ref.read(dailyReportProjectRepositoryProvider(user.uid));
      if (repository == null) {
        state = const AsyncValue.error('リポジトリが初期化されていません', StackTrace.empty);
        return;
      }

      await repository.updateDailyReportProject(
        reportId: _reportId,
        project: project,
      );

      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> deleteProject(String projectId) async {
    state = const AsyncValue.loading();

    try {
      final user = _ref.read(authStateProvider).value;
      if (user == null) {
        state = const AsyncValue.error('ユーザーが認証されていません', StackTrace.empty);
        return;
      }

      final repository =
          _ref.read(dailyReportProjectRepositoryProvider(user.uid));
      if (repository == null) {
        state = const AsyncValue.error('リポジトリが初期化されていません', StackTrace.empty);
        return;
      }

      await repository.deleteDailyReportProject(
        reportId: _reportId,
        projectId: projectId,
      );

      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

// DailyReportProjectNotifier Provider
final dailyReportProjectNotifierProvider = StateNotifierProvider.autoDispose
    .family<DailyReportProjectNotifier, AsyncValue<void>, String>(
  (ref, reportId) => DailyReportProjectNotifier(ref, reportId),
);
