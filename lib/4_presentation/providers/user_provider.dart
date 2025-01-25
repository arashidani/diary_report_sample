// lib/presentation/providers/user_service_provider.dart
import 'package:diary_report_sample/2_application/services/user_service.dart';
import 'package:diary_report_sample/3_infrastructure/firestore/firestore_user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// FirestoreUserRepository を利用して UserService を生成する例
final userServiceProvider = Provider<UserService>((ref) {
  final repository = FirestoreUserRepository();
  return UserService(userRepository: repository);
});
