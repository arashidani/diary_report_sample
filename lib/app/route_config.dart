import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/user_doc_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';

/// RiverpodでGoRouterを提供する
final goRouterProvider =
    NotifierProvider<RouterNotifier, GoRouter>(RouterNotifier.new);

/// Notifier を使って GoRouter を生成する
class RouterNotifier extends Notifier<GoRouter> {
  @override
  GoRouter build() {
    final user = ref.watch(authStateProvider).value; // FirebaseAuthのUser
    final isLoggedIn = user != null;

    final userDoc =
        user == null ? null : ref.watch(userDocProvider(user.uid)).value;
    final isProfileComplete =
        userDoc != null && userDoc.firstName != "" && userDoc.lastName != "";

    return GoRouter(
      initialLocation: Routes.login,
      routes: Routes.routes,
      redirect: (context, state) {
        print('redirect: ${state.uri.path}');
        final path = state.uri.path;

        // 1) 未ログイン時の制御
        if (!isLoggedIn) {
          // main, setup は未ログインなら見せない → loginへ
          if (path == Routes.home || path == Routes.profileSetup) {
            return Routes.login;
          }
          return null;
        }

        // 2) userDocの読み込みがまだの場合（nullの場合）
        if (userDoc == null) {
          // Firestoreが取得し終わっていない → 待機
          return null;
        }

        // 3) プロフィール未完成の場合 → setupへ
        if (!isProfileComplete && path != Routes.profileSetup) {
          return Routes.profileSetup;
        }

        // 4) プロフィール完成済み & setupにいる → mainへ
        if (isProfileComplete && path == Routes.profileSetup) {
          return Routes.home;
        }

        // 5) ログイン済み + プロフィールOK で login, signUp, resetPasswordに居る → mainへ
        final isAuthPage = path == Routes.login ||
            path == Routes.signUp ||
            path == Routes.profileSetup;
        if (isProfileComplete && isAuthPage) {
          return Routes.home;
        }

        return null; // リダイレクト不要
      },
    );
  }
}
