/// Entry point for the TBS Bank application.
///
/// TBSBankApp is now StatefulWidget, owning an [AppNotifier] and wrapping
/// [MaterialApp] in [ListenableBuilder] so theme and locale changes rebuild
/// the entire widget tree reactively.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme/app_theme.dart';
import 'core/notifiers/app_notifier.dart';
import 'core/state/app_state.dart';
import 'core/l10n/app_localizations.dart';
import 'navigation/main_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const TBSBankApp());
}

/// Root application widget — holds [AppNotifier] and reacts to its changes.
class TBSBankApp extends StatefulWidget {
  const TBSBankApp({super.key});

  @override
  State<TBSBankApp> createState() => _TBSBankAppState();
}

class _TBSBankAppState extends State<TBSBankApp> {
  final AppNotifier _notifier = AppNotifier();

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _notifier,
      builder: (_, child) => AppState(
        notifier: _notifier,
        child: MaterialApp(
          title: 'TBS Bank',
          debugShowCheckedModeBanner: false,
          // ── Theme ─────────────────────────────────────────
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: _notifier.themeMode,
          // ── Localization ──────────────────────────────────
          locale: _notifier.locale,
          supportedLocales: const [
            Locale('en'),
            Locale('uz'),
            Locale('ru'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const MainNavigation(),
        ),
      ),
    );
  }
}
