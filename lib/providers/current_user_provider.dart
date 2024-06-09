// ログイン中のユーザデータをフェッチするproviderを作成します
import 'package:diary_report_sample/providers/user_repository_provider.dart';
import 'package:diary_report_sample/providers/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/firebase/users/users.dart';

final currentUserDataProvider =
    StreamProvider.autoDispose<Users?>((ref) async* {
  final userAsyncData = ref.watch(authStateChangesProvider).value;
  if (userAsyncData == null) {
    yield null;
  } else {
    yield* ref.watch(userRepositoryProvider).getUser(userAsyncData.uid);
  }
});
