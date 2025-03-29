import 'package:diary_report_sample/services/app_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  late final AppPreferences _prefs;

  @override
  ThemeMode build() {
    _prefs = ref.read(appPreferencesProvider);
    return _prefs.getThemeMode();
  }

  void toggleTheme() {
    final newTheme =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = newTheme;
    _prefs.setThemeMode(newTheme); // 保存
  }
}

final themeProvider =
    NotifierProvider<ThemeNotifier, ThemeMode>(() => ThemeNotifier());
