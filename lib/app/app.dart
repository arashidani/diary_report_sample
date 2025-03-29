import 'package:diary_report_sample/app/route_config.dart';
import 'package:diary_report_sample/providers/locale_provider.dart';
import 'package:diary_report_sample/providers/theme_provider.dart';
import 'package:diary_report_sample/theme/app_theme.dart';
import 'package:flutter/material.dart' hide Router;

import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final router = ref.watch(goRouterProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      themeMode: themeMode,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: '日報管理システム',
      routerConfig: router,
      locale: locale,
      //TODO: 多言語対応
      // supportedLocales: const [
      //   Locale('ja'),
      //   // Locale('en'),
      // ],
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
    );
  }
}
