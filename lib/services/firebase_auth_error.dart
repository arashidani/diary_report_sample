import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_auth_error.freezed.dart';

@freezed
sealed class FirebaseAuthError with _$FirebaseAuthError {
  const factory FirebaseAuthError.userNotFound() = UserNotFound;
  const factory FirebaseAuthError.wrongPassword() = WrongPassword;
  const factory FirebaseAuthError.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory FirebaseAuthError.invalidEmail() = InvalidEmail;
  const factory FirebaseAuthError.weakPassword() = WeakPassword;
  const factory FirebaseAuthError.operationNotAllowed() = OperationNotAllowed;
  const factory FirebaseAuthError.unknown({required String code}) = Unknown;

  factory FirebaseAuthError.fromCode(String code) {
    print(code);
    switch (code) {
      case 'user-not-found':
        return const FirebaseAuthError.userNotFound();
      case 'wrong-password':
        return const FirebaseAuthError.wrongPassword();
      case 'email-already-in-use':
        return const FirebaseAuthError.emailAlreadyInUse();
      case 'invalid-email':
        return const FirebaseAuthError.invalidEmail();
      case 'weak-password':
        return const FirebaseAuthError.weakPassword();
      case 'operation-not-allowed':
        return const FirebaseAuthError.operationNotAllowed();
      default:
        return FirebaseAuthError.unknown(code: code);
    }
  }
}
