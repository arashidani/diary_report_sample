import 'package:diary_report_sample/services/firebase_auth_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 認証状態の変更を監視するストリーム
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// 現在のユーザーを取得
  User? get currentUser => _auth.currentUser;

  /// メールとパスワードでサインイン
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print(e);
      print('signInWithEmailAndPassword FirebaseAuthException: ${e.code}');
      throw FirebaseAuthError.fromCode(e.code);
    } catch (e) {
      print('signInWithEmailAndPassword Unknown Exception: $e');
      throw const FirebaseAuthError.unknown(code: 'sign-in-failed');
    }
  }

  /// メールとパスワードで新規登録
  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print('signUpWithEmailAndPassword FirebaseAuthException: ${e.code}');
      throw FirebaseAuthError.fromCode(e.code);
    } catch (e) {
      print('signUpWithEmailAndPassword Unknown Exception: $e');
      throw const FirebaseAuthError.unknown(code: 'sign-up-failed');
    }
  }

  /// サインアウト
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print('signOut FirebaseAuthException: ${e.code}');
      throw FirebaseAuthError.fromCode(e.code);
    } catch (e) {
      print('signOut Unknown Exception: $e');
      throw const FirebaseAuthError.unknown(code: 'sign-out-failed');
    }
  }

  /// パスワードリセットメール送信
  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('sendPasswordResetEmail FirebaseAuthException: ${e.code}');
      throw FirebaseAuthError.fromCode(e.code);
    } catch (e) {
      print('sendPasswordResetEmail Unknown Exception: $e');
      throw const FirebaseAuthError.unknown(code: 'reset-password-failed');
    }
  }
}

// class FirebaseAuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   // final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
//
//   Future<User?> signInAnonymously() async {
//     UserCredential userCredential = await _firebaseAuth.signInAnonymously();
//     return userCredential.user;
//   }
//
//   Future<UserCredential> createUserWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     return await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email, password: password);
//   }
//
//   Future<UserCredential> signInWithEmail({
//     required String email,
//     required String password,
//   }) async {
//     return await _firebaseAuth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }
//
//   // Future<UserCredential> signInWithGoogle() async {
//   //   try {
//   //     // Trigger the Google Sign-In flow
//   //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//   //
//   //     if (googleUser == null) {
//   //       throw FirebaseAuthException(
//   //         code: "ERROR_ABORTED_BY_USER",
//   //         message: "Sign in aborted by user.",
//   //       );
//   //     }
//   //
//   //     // Obtain the auth details from the request
//   //     final GoogleSignInAuthentication googleAuth =
//   //         await googleUser.authentication;
//   //
//   //     // Create a new credential
//   //     final OAuthCredential credential = GoogleAuthProvider.credential(
//   //       accessToken: googleAuth.accessToken,
//   //       idToken: googleAuth.idToken,
//   //     );
//   //
//   //     // Sign in with Firebase using the Google credential
//   //     return await _firebaseAuth.signInWithCredential(credential);
//   //   } catch (e) {
//   //     throw FirebaseAuthException(
//   //       code: "ERROR_GOOGLE_SIGN_IN_FAILED",
//   //       message: e.toString(),
//   //     );
//   //   }
//   // }
//
//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//     // await _googleSignIn.signOut(); // Ensure Google Sign-Out as well
//   }
//
//   // Reset password
//   Future<void> resetPassword({required String email}) async {
//     try {
//       await _firebaseAuth.sendPasswordResetEmail(email: email);
//     } catch (e) {
//       throw FirebaseAuthException(
//         code: "ERROR_PASSWORD_RESET_FAILED",
//         message: e.toString(),
//       );
//     }
//   }
// }
