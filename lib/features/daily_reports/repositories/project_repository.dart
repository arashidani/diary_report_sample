import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/daily_reports/models/project.dart';
import 'package:diary_report_sample/features/daily_reports/models/user_project.dart';
import 'package:firestore_client/firestore_client.dart';

class ProjectRepository {
  final FirestoreClient _firestoreClient;
  final String? _userId;

  ProjectRepository(this._firestoreClient, this._userId);

  // ユーザーのプロジェクト一覧を取得
  Future<List<UserProject>> getUserProjects() async {
    if (_userId == null) return [];

    final path = 'users/$_userId/${DatabaseConstants.USER_PROJECTS}';

    return await _firestoreClient.fetchAll<UserProject>(
      collectionPath: path,
      docIds: [],
      fromJson: UserProject.fromJson,
    );
  }

  // ユーザーのプロジェクト一覧をリアルタイムで監視
  Stream<List<UserProject>> watchUserProjects() {
    if (_userId == null) return Stream.value([]);

    final path = 'users/$_userId/${DatabaseConstants.USER_PROJECTS}';

    return _firestoreClient.watchAll<UserProject>(
      collectionPath: path,
      docIds: [],
      fromJson: UserProject.fromJson,
    );
  }

  // プロジェクト詳細を取得
  Future<Project?> getProject(String projectId) async {
    return await _firestoreClient.read<Project>(
      collectionPath: DatabaseConstants.PROJECTS,
      docId: projectId,
      fromJson: Project.fromJson,
    );
  }

  // プロジェクト一覧を取得
  Future<List<Project>> getProjects() async {
    return await _firestoreClient.fetchAll<Project>(
      collectionPath: DatabaseConstants.PROJECTS,
      docIds: [],
      fromJson: Project.fromJson,
    );
  }

  Future<DocumentReference<Object?>> create(project) async {
    return await _firestoreClient.create<UserProject>(
      collectionPath: DatabaseConstants.PROJECTS,
      data: project,
      toJson: (project) => project.toJson(),
    );
  }

  Future<void> update(UserProject project) async {
    return await _firestoreClient.update(
      collectionPath: DatabaseConstants.PROJECTS,
      docId: project.docId,
      data: project,
      toJson: (project) => project.toJson(),
    );
  }

  // ユーザーのプロジェクトを一覧から削除
  Future<void> deleteProject(String id) async {
    print(
      "${DatabaseConstants.USERS}/$_userId}/${DatabaseConstants.PROJECTS}/",
    );
    print(id);
    return await _firestoreClient.delete(
      collectionPath:
          "${DatabaseConstants.USERS}/$_userId}/${DatabaseConstants.PROJECTS}/",
      docId: id,
    );
  }

  // ユーザーのプロジェクト一覧から詳細情報付きのプロジェクトリストを取得
  Future<List<Project>> getUserProjectsWithDetails() async {
    final userProjects = await getUserProjects();
    final List<Project> projects = [];

    for (final userProject in userProjects) {
      final project = await getProject(userProject.docId);
      if (project != null) {
        projects.add(project);
      }
    }

    return projects;
  }
}
