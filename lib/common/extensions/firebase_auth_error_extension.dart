import 'package:diary_report_sample/services/firebase_auth_error.dart';

extension FirebaseAuthErrorMessage on FirebaseAuthError {
  String get title {
    switch (this) {
      case UserNotFound():
        return 'ユーザーが見つかりません';
      case WrongPassword():
        return 'パスワードが間違っています';
      case EmailAlreadyInUse():
        return 'メールアドレスは既に使用されています';
      case InvalidEmail():
        return '無効なメールアドレスです';
      case WeakPassword():
        return 'パスワードが弱すぎます';
      case OperationNotAllowed():
        return '操作が許可されていません';
      case Unknown(code: final code):
        return '認証エラー　($code)';
    }
  }

  String get description {
    switch (this) {
      case UserNotFound():
        return 'このメールアドレスに該当するユーザーが見つかりませんでした。';
      case WrongPassword():
        return '入力されたパスワードが正しくありません。';
      case EmailAlreadyInUse():
        return '他のアカウントで既にこのメールアドレスが使われています。';
      case InvalidEmail():
        return 'メールアドレスの形式が正しくありません。';
      case WeakPassword():
        return 'パスワードは6文字以上で設定してください。';
      case OperationNotAllowed():
        return 'この操作は現在無効になっています。';
      case Unknown(code: final code):
        return '不明なエラーが発生しました（$code）';
    }
  }
}
