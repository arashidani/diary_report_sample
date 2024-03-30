import 'package:diary_report_sample/features/app/app_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  // アプリが起動した時
  initialLocation: '/',
  // パスと画面の組み合わせ
  routes: [
    GoRoute(
      path: '/',
      name: 'initial',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const AppView(),
        );
      },
    ),
    // ex) アカウント画面
    // GoRoute(
    //   path: '/account',
    //   name: 'account',
    //   pageBuilder: (context, state) {
    //     return MaterialPage(
    //       key: state.pageKey,
    //       child: const AccountScreen(),
    //     );
    //   },
    // ),
    // // ex) アカウント詳細画面
    // GoRoute(
    //   path: '/account-detail',
    //   name: 'accountDetail',
    //   pageBuilder: (context, state) {
    //     return MaterialPage(
    //       key: state.pageKey,
    //       child: AccountDetailScreen(state.extra as User),
    //     );
    //   },
    // ),
  ],
  // 遷移ページがないなどのエラーが発生した時に、このページに行く
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
