import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final appPreferencesProvider = Provider<AppPreferences>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AppPreferences(prefs);
});

class AppPreferences {
  static const _keyTheme = 'theme';
  static const _keyLanguage = 'language';

  final SharedPreferences prefs;

  AppPreferences(this.prefs);
  // --- Theme ---
  ThemeMode getThemeMode() {
    final theme = prefs.getString(_keyTheme);
    if (theme == 'light') return ThemeMode.light;
    if (theme == 'dark') return ThemeMode.dark;

    // デフォルト：システムに従う
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final modeStr = mode == ThemeMode.dark ? 'dark' : 'light';
    await prefs.setString(_keyTheme, modeStr);
  }

  // --- Language ---
  Locale getLocale() {
    final code = prefs.getString(_keyLanguage);
    if (code == null) {
      // デフォルトは日本語
      return const Locale('ja');
    }
    return Locale(code);
  }

  Future<void> setLocale(Locale locale) async {
    await prefs.setString(_keyLanguage, locale.languageCode);
  }
}
