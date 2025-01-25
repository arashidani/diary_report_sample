import 'package:diary_report_sample/4_presentation/screens/login_page.dart';
import 'package:diary_report_sample/4_presentation/screens/pfofile_setup_page.dart';
import 'package:diary_report_sample/4_presentation/screens/sign_up_page.dart';
import 'package:diary_report_sample/4_presentation/screens/top_view.dart';
import 'package:diary_report_sample/features/error_page.dart';
import 'package:diary_report_sample/features/root/providers/auth_state_provider.dart';
import 'package:diary_report_sample/features/root/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RootView extends ConsumerWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 認証状態
    final authState = ref.watch(authStateProvider);
    // Firestoreユーザードキュメントの状態
    final userState = ref.watch(usersProvider);

    // // ローディングやエラーをまとめて判定する
    // if (authState.isLoading || userState.isLoading) {
    //   return const SplashView();
    //   // return const LoadingPage();
    // }
    if (authState.hasError) {
      return ErrorPage(error: authState.error.toString());
    }
    if (userState.hasError) {
      return ErrorPage(error: userState.error.toString());
    }

    // authState.data: User?
    final authUser = authState.value;
    if (authUser == null) {
      // ログインしていない
      return const LoginPage();
    }

    // userDocState.data: UserModel?
    final user = userState.value;
    print(user);
    if (user == null) {
      // ログイン済みだがFirestoreドキュメントなし
      // return const ProfileSetupPage();
      return ProfileSetupPage(
        authUser: authUser,
      );
    } else {
      if (user.firstName == '' || user.lastName == '')
        return ProfileSetupPage(authUser: authUser);
      // ログイン済み&ドキュメント有り
      // return const HomePage();

      return const TopView();
    }
  }
}
