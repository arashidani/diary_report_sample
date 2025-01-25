import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MaterialAppTheme {
  // ライトテーマ
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
    ),
  );

  // ダークテーマ
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
    ),
  );
}

class CupertinoAppTheme {
  // ライトテーマ
  static final CupertinoThemeData lightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.systemBlue,
    barBackgroundColor: CupertinoColors.systemBlue,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(color: CupertinoColors.black),
      actionTextStyle: TextStyle(color: CupertinoColors.systemBlue),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // ダークテーマ
  static final CupertinoThemeData darkTheme = const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.systemPurple,
    barBackgroundColor: CupertinoColors.systemPurple,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(color: CupertinoColors.white),
      actionTextStyle: TextStyle(color: CupertinoColors.systemPurple),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
