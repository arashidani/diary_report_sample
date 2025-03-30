// lib/features/daily_reports/repositories/daily_report_project_repository.dart
import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/daily_reports/models/daily_report_project.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_client/firestore_client.dart';

class DailyReportProjectRepository {
  final FirestoreClient _firestoreClient;
  final String _userId;

  DailyReportProjectRepository(this._firestoreClient, this._userId);

  // 日報プロジェクトを取得
  Future<List<DailyReportProject>> getDailyReportProjects(
      String reportId) async {
    final path =
        'users/$_userId/${DatabaseConstants.DAILY_REPORTS}/$reportId/${DatabaseConstants.DAILY_REPORT_PROJECTS}';

    return await _firestoreClient.fetchAll<DailyReportProject>(
      collectionPath: path,
      docIds: [],
      fromJson: DailyReportProject.fromJson,
    );
  }

  // 日報プロジェクトをリアルタイムで監視
  Stream<List<DailyReportProject>> watchDailyReportProjects(String reportId) {
    final path =
        'users/$_userId/${DatabaseConstants.DAILY_REPORTS}/$reportId/${DatabaseConstants.DAILY_REPORT_PROJECTS}';

    return _firestoreClient.watchAll<DailyReportProject>(
      collectionPath: '',
      docIds: [],
      fromJson: DailyReportProject.fromJson,
    );
  }

  // 日報プロジェクトを作成
  Future<void> createDailyReportProject({
    required String reportId,
    required DailyReportProject project,
  }) async {
    final path =
        'users/$_userId/${DatabaseConstants.DAILY_REPORTS}/$reportId/${DatabaseConstants.DAILY_REPORT_PROJECTS}';

    await _firestoreClient.create(
      collectionPath: path,
      docId: project.docId,
      data: project,
      toJson: (project) => project.toJson(),
    );
  }

  // 日報プロジェクトを更新
  Future<void> updateDailyReportProject({
    required String reportId,
    required DailyReportProject project,
  }) async {
    final path =
        'users/$_userId/${DatabaseConstants.DAILY_REPORTS}/$reportId/${DatabaseConstants.DAILY_REPORT_PROJECTS}';

    await _firestoreClient.update(
      collectionPath: path,
      docId: project.docId,
      data: project,
      toJson: (project) => project.toJson(),
    );
  }

  // 日報プロジェクトを削除
  Future<void> deleteDailyReportProject({
    required String reportId,
    required String projectId,
  }) async {
    final path =
        'users/$_userId/${DatabaseConstants.DAILY_REPORTS}/$reportId/${DatabaseConstants.DAILY_REPORT_PROJECTS}';

    await _firestoreClient.delete(
      collectionPath: path,
      docId: projectId,
    );
  }
}
