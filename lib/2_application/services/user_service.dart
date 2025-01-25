// lib/application/services/user_service.dart
import 'package:diary_report_sample/1_domain/models/firebase/users/users.dart';
import 'package:diary_report_sample/1_domain/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';

class UserService {
  final UserRepository userRepository;

  UserService({@required required this.userRepository});

  /// ユーザーの新規作成
  Future<void> createUser(Users user) async {
    await userRepository.createUser(user);
  }

  /// ユーザー情報の更新
  Future<void> updateUser(Users user) async {
    await userRepository.updateUser(user);
  }

  /// ユーザー削除
  Future<void> deleteUser(String userId) async {
    await userRepository.deleteUser(userId);
  }

  /// ユーザー取得（IDによる）
  Future<Users?> getUser(String userId) async {
    return await userRepository.getUser(userId);
  }

  /// メールアドレスからユーザーを取得（認証時などに利用）
  Future<Users?> getUserByEmail(String email) async {
    return await userRepository.getUserByEmail(email);
  }
}
