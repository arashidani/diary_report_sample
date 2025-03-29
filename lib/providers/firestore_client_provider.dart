import 'package:firestore_client/firestore_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreClientProvider = Provider.autoDispose<FirestoreClient>((ref) {
  return FirestoreClient(); // 必要であれば、Mock版に差し替え可能
});
