import 'package:diary_report_sample/theme/colors.dart';
import 'package:diary_report_sample/theme/fonts.dart';
import 'package:flutter/material.dart';

class MyAppTheme {
  const MyAppTheme._(); // インスタンス化防止用の private コンストラクタ

  // ライトテーマ
  static final ThemeData lightTheme = ThemeData(
    fontFamily: BrandFont.general,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: BrandColor.seedColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: BrandColor.seedColor,
      foregroundColor: Colors.white,
    ),
    textTheme: _customTextTheme(Brightness.light),
  );

  // ダークテーマ
  static final ThemeData darkTheme = ThemeData(
    fontFamily: BrandFont.general,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: BrandColor.seedColor,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: BrandColor.seedColor,
      foregroundColor: Colors.white,
    ),
    textTheme: _customTextTheme(Brightness.dark),
  );

  static TextTheme _customTextTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: brightness == Brightness.light
          ? BrandColor.regularTextColor
          : Colors.white,
      brightness: brightness,
    );

    return const TextTheme().apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }
}
