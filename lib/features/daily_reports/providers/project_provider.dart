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
