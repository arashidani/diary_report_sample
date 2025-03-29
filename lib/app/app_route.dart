import 'package:diary_report_sample/app/route_transitions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// ルートの種類に応じたトランジション
enum RouteType {
  noAnimation,
  fade,
  slide,
}

/// AppRouteモデル
class AppRoute {
  final String path;
  final String? name;
  final Widget Function(BuildContext) builder;
  final RouteType transition;

  const AppRoute({
    required this.path,
    this.name,
    required this.builder,
    required this.transition,
  });
}

GoRoute toGoRoute(AppRoute appRoute) {
  return GoRoute(
    path: appRoute.path,
    name: appRoute.name,
    pageBuilder: (context, state) {
      switch (appRoute.transition) {
        case RouteType.noAnimation:
          return noTransitionPageBuilder(appRoute.builder(context), state);
        case RouteType.fade:
          return fadeTransitionPageBuilder(appRoute.builder(context), state);
        case RouteType.slide:
          return slideTransitionPageBuilder(appRoute.builder(context), state);
      }
    },
  );
}
