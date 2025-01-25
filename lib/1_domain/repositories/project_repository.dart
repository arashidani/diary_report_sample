// // lib/domain/repositories/project_repository.dart
//
// import '../entities/project.dart';
//
// abstract class ProjectRepository {
//   /// 指定したIDの案件情報を取得する
//   Future<Project?> getProject(String projectId);
//
//   /// 指定したユーザーに紐づく案件リストを取得する
//   Future<List<Project>> getProjectsByUser(String userId);
//
//   /// 新規案件を作成する
//   Future<void> createProject(Project project);
//
//   /// 案件情報を更新する
//   Future<void> updateProject(Project project);
//
//   /// 指定したIDの案件を削除する
//   Future<void> deleteProject(String projectId);
// }
