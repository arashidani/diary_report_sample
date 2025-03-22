import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Firestoreのユーザードキュメントを監視するProvider

import 'firestore_client_provider.dart';

final userDocProvider =
    StreamProvider.autoDispose.family<Users?, String>((ref, uid) {
  final firestoreClient = ref.watch(firestoreClientProvider);
  return firestoreClient.watch<Users>(
    collectionPath: DatabaseConstants.USERS,
    docId: uid,
    fromJson: Users.fromJson,
  );
});
