import 'package:diary_report_sample/features/auth/views/forget_password_page.dart';
import 'package:diary_report_sample/features/auth/views/login_page.dart';
import 'package:diary_report_sample/features/auth/views/profile_setup_page.dart';
import 'package:diary_report_sample/features/auth/views/sign_up_page.dart';
import 'package:diary_report_sample/features/daily_reports/views/daily_reports_view.dart';
import 'package:diary_report_sample/features/lincense/view/show_license_page.dart';
import 'package:diary_report_sample/features/root/views/root_view.dart';
import 'package:diary_report_sample/features/setting/views/setting_view.dart';
import 'package:go_router/go_router.dart';

// 静的な Route クラス
class Routes {
  const Routes._(); // インスタンス化させないための private コンストラクタ
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String forgetPassword = '/forget-password';
  static const String profileSetup = '/profile-setup';

  // ルート
  static const String root = '/';

  // サブページ用
  static const String home = '/';
  static const String dailyReports = '/daily-reports';
  static const String setting = '/setting';

  // settingから遷移
  static const String licence = '/licence';

  // 認証が必要なページ
  static const List<String> requiresAuth = [
    home,
    profileSetup,
    dailyReports,
    setting,
    licence,
  ];

  // ログインユーザーがアクセス不要なページ（ログイン後はリダイレクト）
  static const List<String> authPages = [
    login,
    signUp,
    forgetPassword,
    profileSetup,
  ];

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
    ShellRoute(
      builder: (context, state, child) => RootView(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: home,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/daily-reports',
          name: dailyReports,
          builder: (context, state) => const DailyReportsView(),
        ),
        GoRoute(
          path: '/setting',
          name: setting,
          builder: (context, state) => const SettingView(),
        ),
        GoRoute(
          path: '/licence',
          name: Routes.licence,
          builder: (context, state) => const ShowLicencePage(),
        ),
      ],
    ),
  ];
}
