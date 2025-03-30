// lib/features/projects/providers/project_provider.dart
import 'package:diary_report_sample/features/daily_reports/models/project.dart';
import 'package:diary_report_sample/features/daily_reports/models/user_project.dart';
import 'package:diary_report_sample/features/daily_reports/repositories/project_repository.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/firestore_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ProjectRepository Provider
final projectRepositoryProvider = Provider.autoDispose((ref) {
  final firestoreClient = ref.watch(firestoreClientProvider);
  final user = ref.watch(authStateProvider).value;
  return ProjectRepository(firestoreClient, user?.uid);
});

// ユーザーのプロジェクト一覧を取得する Provider
final userProjectsProvider =
    StreamProvider.autoDispose<List<UserProject>>((ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.watchUserProjects();
});

// 全プロジェクト一覧を取得する Provider
final projectsProvider = FutureProvider.autoDispose<List<Project>>((ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.getProjects();
});

// ユーザーのプロジェクト詳細情報を取得する Provider
final userProjectsWithDetailsProvider =
    FutureProvider.autoDispose<List<Project>>((ref) {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.getUserProjectsWithDetails();
});

// 特定のプロジェクト情報を取得する Provider
final projectProvider =
    FutureProvider.autoDispose.family<Project?, String>((ref, projectId) {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.getProject(projectId);
});
