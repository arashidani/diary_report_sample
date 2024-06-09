import 'package:diary_report_sample/features/app/auth/auth_widget.dart';
import 'package:diary_report_sample/features/app/details_page.dart';
import 'package:diary_report_sample/features/app/feed_page.dart';
import 'package:diary_report_sample/features/app/home_view.dart';
import 'package:diary_report_sample/features/app/auth/login_page.dart';
import 'package:diary_report_sample/features/app/account_view.dart';
import 'package:diary_report_sample/features/app/table_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:diary_report_sample/features/app/navbar/scaffold_with_navbar.dart';

import '../features/app/auth/user_info.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
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
              path: '/home',
              builder: (context, state) => const HomeView(),
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
            builder: (context, state) => const AccountView(),
            routes: <RouteBase>[
              GoRoute(
                path: 'auth',
                builder: (context, state) {
                  return AuthWidget();
                },
              )
            ],
          ),
        ])
      ],
    ),
  ],
);
