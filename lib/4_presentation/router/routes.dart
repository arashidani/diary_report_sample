import 'package:diary_report_sample/4_presentation/screens/forget_password_page.dart';
import 'package:diary_report_sample/4_presentation/screens/sign_up_page.dart';
import 'package:diary_report_sample/features/app/auth/login_page.dart';
import 'package:diary_report_sample/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  // 各Viewを定義
  static const String root = '/';
  static const String topView = '/top-view';
  static const String signupPage = '/signup-page';
  static const String loginPage = '/login-page';
  static const String forgetPasswordPage = '/forget-password-page';
}

class MyRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashView(),
        );
      case Routes.signupPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SignUpPage(),
        );
      case Routes.loginPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginPage(),
        );
      case Routes.forgetPasswordPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ForgetPasswordPage(),
        );
      default:
        return _wakeupLaunch();
    }
  }

  static Route<dynamic> _wakeupLaunch() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const LoginPage(),
    );
  }
}
