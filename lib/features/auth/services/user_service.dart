import 'package:diary_report_sample/constants/database_constants.dart';
import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:diary_report_sample/features/auth/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_client/firestore_client.dart';

class UserService {
  final FirebaseAuthService _authService;
  final FirestoreClient _firestoreClient;

  UserService({
    required FirebaseAuthService authService,
    required FirestoreClient firestoreClient,
  })  : _authService = authService,
        _firestoreClient = firestoreClient;

  /// 現在のFirebaseユーザーID
  String? get _uid => _authService.currentUser?.uid;

  /// Firestoreの`users`コレクションパス
  static const String collectionPath = DatabaseConstants.USERS;

  /// FirebaseAuthでサインイン
  Future<User?> signIn(
      {required String email, required String password}) async {
    final credential = await _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  /// FireAuthでサインアウト
  Future signOut() async {
    await _authService.signOut();
  }

  /// FirebaseAuthのresetPassword
  Future resetPassword({required String email}) async {
    await _authService.resetPassword(email: email);
  }

  /// Firestoreのユーザードキュメント取得
  Future<Users?> fetchCurrentUser() async {
    final uid = _uid;
    if (uid == null) return null;

    return await _firestoreClient.read(
      collectionPath: collectionPath,
      docId: uid,
      fromJson: (json) => Users.fromJson(json),
    );
  }

  /// Firestoreのユーザーを新規作成（存在しない場合のみ）
  Future<void> createUser(String email, String password) async {
    final user =
        await _authService.createUserWithEmailAndPassword(email, password);
    final existing = await _firestoreClient.read<Users>(
      collectionPath: collectionPath,
      docId: user!.uid,
      fromJson: (json) => Users.fromJson(json),
    );

    if (existing == null) {
      final newUser = Users(
        docId: user.uid,
        email: email,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await _firestoreClient.create(
        collectionPath: collectionPath,
        docId: user.uid,
        data: newUser,
        toJson: (newUser) => newUser.toJson(),
      );
    }
  }

  /// ユーザー情報を更新
  Future<void> updateUser(Users updatedUser) async {
    await _firestoreClient.update(
      collectionPath: collectionPath,
      docId: updatedUser.docId,
      data: updatedUser,
      toJson: (u) => u.toJson(),
    );
  }

  /// Firestoreからユーザー情報を削除
  Future<void> deleteUser() async {
    final uid = _uid;
    if (uid == null) return;
    await _firestoreClient.delete(
      collectionPath: collectionPath,
      docId: uid,
    );
  }

  /// リアルタイムでユーザードキュメントを監視
  Stream<Users?> watchCurrentUser() {
    final uid = _uid;
    if (uid == null) return const Stream.empty();

    return _firestoreClient.watch<Users>(
      collectionPath: collectionPath,
      docId: uid,
      fromJson: (json) => Users.fromJson(json),
    );
  }
}
