import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:diary_report_sample/features/auth/services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_notifier_provider.dart';

class UserNotifier extends AsyncNotifier<Users?> {
  late final UserService _userService;

  @override
  Future<Users?> build() async {
    _userService = ref.read(usersRepositoryProvider);
    return await _userService.fetchCurrentUser();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await _userService.signIn(email: email, password: password);
      state = AsyncValue.data(await _userService.fetchCurrentUser());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _userService.signOut();
      state = const AsyncValue.data(null);
      ref.invalidate(userNotifierProvider);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> createUser(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();
    try {
      await _userService.createUser(email, password);
      state = AsyncValue.data(await _userService.fetchCurrentUser());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateUser(Users user) async {
    state = const AsyncValue.loading();
    try {
      await _userService.updateUser(user);
      state = AsyncValue.data(await _userService.fetchCurrentUser());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteUser() async {
    state = const AsyncValue.loading();
    try {
      await _userService.deleteUser();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void fetchUser() async {
    state = const AsyncValue.loading();
    try {
      final user = await _userService.fetchCurrentUser();
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
