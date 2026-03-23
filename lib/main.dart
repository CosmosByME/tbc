/// Entry point for the TBS Bank application.
///
/// Sets up [MaterialApp] with the app theme, disables the debug banner,
/// and launches [MainNavigation] as the home widget.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/theme/app_theme.dart';
import 'navigation/main_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set status bar to dark icons on light background.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const TBSBankApp());
}

/// Root application widget.
class TBSBankApp extends StatelessWidget {
  const TBSBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TBS Bank',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
    );
  }
}
