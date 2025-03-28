import 'package:diary_report_sample/common/pages/error_page.dart';
import 'package:diary_report_sample/providers/auth_state_provider.dart';
import 'package:diary_report_sample/providers/user_doc_provider.dart';
import 'package:flutter/material.dart';
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
      errorBuilder: (context, state) {
        debugPrint('${state.error}');
        return const ErrorPage();
      },
      redirect: (context, state) {
        final path = state.uri.path;

        // 1) 未ログイン時の制御
        if (!isLoggedIn && Routes.requiresAuth.contains(path)) {
          return Routes.login;
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
        if (isLoggedIn &&
            isProfileComplete &&
            Routes.authPages.contains(path)) {
          return Routes.home;
        }

        return null; // リダイレクト不要
      },
    );
  }
}
