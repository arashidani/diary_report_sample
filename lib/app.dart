import 'package:bot_toast/bot_toast.dart';
import 'package:diary_report_sample/4_presentation/theme/app_theme.dart';
import 'package:diary_report_sample/features/root/view/root_view.dart';
import 'package:flutter/material.dart' hide Router;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '4_presentation/router/routes.dart';
import '4_presentation/theme/theme_notifier.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(materialThemeProvider);

    return MaterialApp(
      // supportedLocales: const [
      //   Locale('en', ''),
      //   Locale('ja', ''),
      // ],
      builder: (context, Widget? child) {
        return BotToastInit()(context, child);
      },
      debugShowCheckedModeBanner: false,
      title: 'Title',
      onGenerateRoute: MyRouter.onGenerateRoute,
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      theme: MaterialAppTheme.lightTheme,
      darkTheme: MaterialAppTheme.darkTheme,
      themeMode: themeMode,
      home: const RootView(),
    );
  }
}
