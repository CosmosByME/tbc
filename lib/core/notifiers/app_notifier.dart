/// ChangeNotifier that holds global app settings: ThemeMode and Locale.
/// Consumed via ListenableBuilder at the root to rebuild MaterialApp.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tbc/core/theme/app_colors.dart';

class AppNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');
  String? _userName;
  int _currentTabIndex = 0;

  final List<Map<String, dynamic>> _cards = [
    {
      'rawBalance': 129450.00,
      'balance': '\$129,450.00',
      'cardNumber': '**** 4482',
      'cardType': 'VISA',
      'label': 'TBS PREMIER',
      'color': AppColors.primary,
    },
    {
      'rawBalance': 7200.50,
      'balance': '\$7,200.50',
      'cardNumber': '**** 8819',
      'cardType': 'Mastercard',
      'label': 'Savings Account',
      'color': const Color(0xFF2C3E50),
    },
  ];

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  String? get userName => _userName;
  int get currentTabIndex => _currentTabIndex;
  List<Map<String, dynamic>> get cards => _cards;

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

  void setUserName(String name) {
    if (_userName == name) return;
    _userName = name;
    notifyListeners();
  }

  void setTabIndex(int index) {
    if (_currentTabIndex == index) return;
    _currentTabIndex = index;
    notifyListeners();
  }

  void performTransfer(int cardIndex, double amount) {
    final card = _cards[cardIndex];
    final currentRaw = card['rawBalance'] as double;
    final newRaw = currentRaw - amount;

    card['rawBalance'] = newRaw;

    // Format the new string balance
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    card['balance'] = formatter.format(newRaw);

    notifyListeners();
  }
}
