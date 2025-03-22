import 'package:diary_report_sample/features/auth/models/users.dart';
import 'package:diary_report_sample/features/auth/views/forget_password_page.dart';
import 'package:diary_report_sample/features/auth/views/login_page.dart';
import 'package:diary_report_sample/features/auth/views/profile_setup_page.dart';
import 'package:diary_report_sample/features/auth/views/sign_up_page.dart';
import 'package:diary_report_sample/features/root/views/root_view.dart';
import 'package:diary_report_sample/top_view.dart';
import 'package:go_router/go_router.dart';

// 静的な Route クラス
class Routes {
  const Routes._(); // インスタンス化させないための private コンストラクタ
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String forgetPassword = '/forget-password';
  static const String profileSetup = '/profile-setup';
  static const String home = '/';

  static final routes = [
    GoRoute(
      path: login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: signUp,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: forgetPassword,
      builder: (context, state) => const ResetPasswordPage(),
    ),
    GoRoute(
      path: profileSetup,
      builder: (context, state) => const SetUpPage(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const RootView(),
    ),
  ];
}
