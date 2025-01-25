import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '4_presentation/router/routes.dart';
import '4_presentation/theme/app_theme.dart';
import '4_presentation/theme/theme_notifier.dart';
import 'features/root/view/root_view.dart';
import 'package:flutter/material.dart' hide Router;

class CupertinoAppWrapper extends ConsumerWidget {
  const CupertinoAppWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(cupertinoThemeProvider);

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Title',
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      // supportedLocales: const [
      //   Locale('en', ''),
      //   Locale('ja', ''),
      // ],
      onGenerateRoute: MyRouter.onGenerateRoute,
      theme: isDarkMode
          ? CupertinoAppTheme.darkTheme
          : CupertinoAppTheme.lightTheme,

      home: const RootView(),
    );
  }
}

class MaterialAppWrapper extends ConsumerWidget {
  const MaterialAppWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(materialThemeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Title',
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en', ''),
      //   Locale('ja', ''),
      // ],
      onGenerateRoute: MyRouter.onGenerateRoute,
      theme: MaterialAppTheme.lightTheme,
      darkTheme: MaterialAppTheme.darkTheme,
      themeMode: themeMode,
      home: const RootView(),
    );
  }
}
