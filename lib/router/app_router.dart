import 'package:diary_report_sample/features/app/details_page.dart';
import 'package:diary_report_sample/features/app/feed_page.dart';
import 'package:diary_report_sample/features/app/home_view.dart';
import 'package:diary_report_sample/features/app/side_drawer.dart';
import 'package:diary_report_sample/features/app/table_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:diary_report_sample/features/app/navbar/scaffold_with_navbar.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/feed',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/feed',
              builder: (context, state) => const FeedPage(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  builder: (context, state) {
                    return const DetailsPage(label: 'FeedDetails');
                  },
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/list',
            builder: (context, state) {
              return TableView();
            },
          ),
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/account',
            builder: (context, state) {
              return const HomeView();
            },
          ),
        ])
      ],
    ),
  ],
);
