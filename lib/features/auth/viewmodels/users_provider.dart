import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:diary_report_sample/features/auth/repositories/users_repository.dart';
import 'package:firestore_client/firestore_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersNotifier extends Notifier<Users?> {
  late final UsersRepository _repository;

  @override
  Users? build() {
    _repository = ref.watch(_usersRepositoryProvider);
    return null;
  }

  Future<void> fetchUser(String userId) async {
    state = await _repository.getUser(userId);
  }

  Future<void> createUser(Users user) async {
    await _repository.createUser(user);
    state = user;
  }

  Future<void> updateUser(Users user) async {
    await _repository.updateUser(user);
    state = user;
  }

  Future<void> deleteUser(String userId) async {
    await _repository.deleteUser(userId);
    state = null;
  }
}

// UsersRepositoryをDI可能にするProvider
// _ をつけてライブラリスコープにし、同ファイル内 or 同ライブラリ内以外では使えないようにする
final _usersRepositoryProvider = Provider<UsersRepository>((ref) {
  final firestoreClient = FirestoreClient(); // 必要に応じてDI
  return UsersRepository(firestoreClient);
});

// NotifierProviderもDIを使って構築
final usersProvider =
    NotifierProvider<UsersNotifier, Users?>(() => UsersNotifier());
