import 'package:diary_report_sample/app/app_route.dart';
import 'package:diary_report_sample/app/route_transitions.dart';
import 'package:diary_report_sample/features/auth/views/forget_password_page.dart';
import 'package:diary_report_sample/features/auth/views/login_page.dart';
import 'package:diary_report_sample/features/auth/views/profile_setup_page.dart';
import 'package:diary_report_sample/features/auth/views/sign_up_page.dart';
import 'package:diary_report_sample/features/daily_reports/views/daily_reports_view.dart';
import 'package:diary_report_sample/features/lincense/view/show_license_page.dart';
import 'package:diary_report_sample/features/root/views/root_view.dart';
import 'package:diary_report_sample/features/setting/views/setting_view.dart';
import 'package:go_router/go_router.dart';

final List<AppRoute> appRoutes = [
  AppRoute(
    path: Routes.login,
    builder: (_) => const LoginPage(),
    transition: RouteType.fade,
  ),
  AppRoute(
    path: Routes.signUp,
    builder: (_) => const SignUpPage(),
    transition: RouteType.fade,
  ),
  AppRoute(
    path: Routes.profileSetup,
    builder: (_) => const SetUpPage(),
    transition: RouteType.slide,
  ),
  AppRoute(
    path: Routes.forgetPassword,
    builder: (_) => const ResetPasswordPage(),
    transition: RouteType.fade,
  ),
];

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
    ...appRoutes.map(toGoRoute),
    GoRoute(
      path: login,
      pageBuilder: (context, state) =>
          slideTransitionPageBuilder(const LoginPage(), state),
    ),
    GoRoute(
      path: signUp,
      pageBuilder: (context, state) =>
          slideTransitionPageBuilder(const SignUpPage(), state),
    ),
    GoRoute(
      path: forgetPassword,
      pageBuilder: (context, state) =>
          slideTransitionPageBuilder(const ResetPasswordPage(), state),
    ),
    GoRoute(
      path: profileSetup,
      pageBuilder: (context, state) =>
          slideTransitionPageBuilder(const SetUpPage(), state),
    ),
    ShellRoute(
      builder: (context, state, child) => RootView(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: home,
          pageBuilder: (context, state) =>
              noTransitionPageBuilder(HomeScreen(), state),
        ),
        GoRoute(
          path: '/daily-reports',
          name: dailyReports,
          pageBuilder: (context, state) =>
              noTransitionPageBuilder(const DailyReportsView(), state),
        ),
        GoRoute(
          path: '/setting',
          name: setting,
          pageBuilder: (context, state) =>
              noTransitionPageBuilder(const SettingView(), state),
        ),
        GoRoute(
          path: '/licence',
          name: Routes.licence,
          pageBuilder: (context, state) =>
              slideTransitionPageBuilder(const ShowLicencePage(), state),
        ),
      ],
    ),
  ];
}
