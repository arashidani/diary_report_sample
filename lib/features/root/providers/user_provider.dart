import 'package:diary_report_sample/1_domain/models/firebase/users/users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_state_provider.dart';
import 'firestoreServiceProvider.dart';

final usersProvider = StreamProvider<Users>((ref) {
  // 認証状態のプロバイダを監視
  final authUserAsync = ref.watch(authStateProvider);

  return authUserAsync.when<Stream<Users>>(
    data: (authUser) {
      // 認証済みユーザーが null の場合は空のストリームを返す
      if (authUser == null) return const Stream<Users>.empty();

      final firestore = ref.watch(firestoreServiceProvider);
      // Firestore 内のユーザー情報は 'users/{uid}' に保存されている前提
      final String path = 'users/${authUser.uid}';

      return firestore.docStream<Users>(
        path: path,
        fromFirestore: (data, documentId) =>
            Users.fromFirestore(data, documentId),
      );
    },
    error: (error, stack) => Stream<Users>.error(error),
    loading: () => const Stream<Users>.empty(),
  );
});
