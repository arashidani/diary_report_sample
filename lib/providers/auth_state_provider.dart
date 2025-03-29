import 'package:diary_report_sample/features/auth/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// FirebaseAuthServiceをグローバルに提供するプロバイダ
final firebaseAuthServiceProvider =
    Provider.autoDispose<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

/// 認証状態のストリームを公開するStreamProvider
final authStateProvider = StreamProvider.autoDispose<User?>((ref) {
  final authService = ref.watch(firebaseAuthServiceProvider);
  return authService.authStateChanges.map((user) {
    return user;
  });
});
