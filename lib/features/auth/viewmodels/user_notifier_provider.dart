import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:diary_report_sample/features/auth/services/firebase_auth_service.dart';
import 'package:diary_report_sample/features/auth/services/user_service.dart';
import 'package:diary_report_sample/features/auth/viewmodels/users_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firestore_client/firestore_client.dart';

final firestoreClientProvider = Provider<FirestoreClient>((ref) {
  return FirestoreClient();
});

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

final usersRepositoryProvider = Provider<UserService>((ref) {
  return UserService(
    authService: ref.watch(firebaseAuthServiceProvider),
    firestoreClient: ref.watch(firestoreClientProvider),
  );
});

final userNotifierProvider =
    AsyncNotifierProvider<UserNotifier, Users?>(() => UserNotifier());
