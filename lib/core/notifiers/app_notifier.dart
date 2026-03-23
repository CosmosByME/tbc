/// ChangeNotifier that holds global app settings: ThemeMode and Locale.
/// Consumed via ListenableBuilder at the root to rebuild MaterialApp.
import 'package:flutter/material.dart';

class AppNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }

  void setLocale(Locale newLocale) {
    if (_locale.languageCode == newLocale.languageCode) return;
    _locale = newLocale;
    notifyListeners();
  }
}
