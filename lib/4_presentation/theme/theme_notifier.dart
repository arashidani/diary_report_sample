import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MaterialThemeNotifier extends StateNotifier<ThemeMode> {
  MaterialThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

final materialThemeProvider =
    StateNotifierProvider<MaterialThemeNotifier, ThemeMode>((ref) {
  return MaterialThemeNotifier();
});

class CupertinoThemeNotifier extends StateNotifier<bool> {
  CupertinoThemeNotifier() : super(false); // 初期値としてfalseライトモード

  void toggleTheme() {
    state = !state;
  }

  void setTheme(bool isDark) {
    state = isDark;
  }
}

final cupertinoThemeProvider =
    StateNotifierProvider<CupertinoThemeNotifier, bool>((ref) {
  return CupertinoThemeNotifier();
});
