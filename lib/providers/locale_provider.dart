import 'dart:ui';

import 'package:diary_report_sample/services/app_preferences_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleNotifier extends Notifier<Locale> {
  late final AppPreferences _prefs;

  @override
  Locale build() {
    _prefs = ref.read(appPreferencesProvider);
    return _prefs.getLocale(); // 保存されたロケールを使う
  }

  void changeLocale(Locale locale) {
    state = locale;
    _prefs.setLocale(locale); // 保存
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale>(() => LocaleNotifier());
