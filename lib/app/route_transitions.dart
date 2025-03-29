import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// フェードアニメーション
CustomTransitionPage fadeTransitionPageBuilder(
    Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

/// スライドアニメーション（右→左）
CustomTransitionPage slideTransitionPageBuilder(
    Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, _, child) {
      final tween = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeInOut));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

/// アニメーションなし
NoTransitionPage noTransitionPageBuilder(Widget child, GoRouterState state) {
  return NoTransitionPage(
    key: state.pageKey,
    child: child,
  );
}
