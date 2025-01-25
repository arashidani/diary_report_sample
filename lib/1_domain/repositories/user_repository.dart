// lib/domain/repositories/user_repository.dart

import 'package:diary_report_sample/1_domain/models/firebase/users/users.dart';

abstract class UserRepository {
  /// 指定したIDのユーザー情報を取得する
  Future<Users?> getUser(String userId);

  /// ユーザーの新規作成
  Future<void> createUser(Users user);

  /// 既存ユーザー情報の更新
  Future<void> updateUser(Users user);

  /// 指定したIDのユーザーを削除する
  Future<void> deleteUser(String userId);

  /// メールアドレスからユーザー情報を取得（認証などに利用）
  Future<Users?> getUserByEmail(String email);

  ///
  Future<void> createUserProfile({
    required String userId,
    required String email,
    required String firstName,
    required String lastName,
  });
}
