import 'package:flutter/material.dart';

import 'package:diary_report_sample/features/app/app_view.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (_) => const AppView(),
        );
    // case hoge:
    //   return MaterialPageRoute(
    //     // 遷移先のページを定指定
    //     builder: (_) => Hoge(),
    //     fullscreenDialog: true,
    //   );
      default:
      // 非該当時
        throw Exception('Route not found');
    }
  }
}