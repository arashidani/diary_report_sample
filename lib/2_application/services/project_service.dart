// // lib/application/services/project_service.dart
// import 'package:diary_report_sample/1_domain/repositories/project_repository.dart';
// import 'package:flutter/foundation.dart';
// import '../../domain/entities/project.dart';
//
// class ProjectService {
//   final ProjectRepository projectRepository;
//
//   ProjectService({@required required this.projectRepository});
//
//   /// 案件（プロジェクト）の新規作成
//   Future<void> createProject(Project project) async {
//     await projectRepository.createProject(project);
//   }
//
//   /// 案件の更新
//   Future<void> updateProject(Project project) async {
//     await projectRepository.updateProject(project);
//   }
//
//   /// 案件の削除
//   Future<void> deleteProject(String projectId) async {
//     await projectRepository.deleteProject(projectId);
//   }
//
//   /// 単一案件情報の取得
//   Future<Project?> getProject(String projectId) async {
//     return await projectRepository.getProject(projectId);
//   }
//
//   /// ユーザーに紐づく案件一覧を取得
//   Future<List<Project>> getProjectsByUser(String userId) async {
//     return await projectRepository.getProjectsByUser(userId);
//   }
// }
