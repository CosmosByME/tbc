import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/state/app_state.dart';
import 'name_input_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cardColor = TBSColors.card(context);
    final backgroundColor = TBSColors.background(context);
    final textColor = TBSColors.textPrimary(context);

    void selectLanguage(Locale locale) {
      AppState.of(context).setLocale(locale);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NameInputScreen()),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'T',
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                l10n.chooseLanguage,
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Please select your preferred language',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: TBSColors.textSecondary(context),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              _LanguageTile(
                flag: '🇺🇸',
                title: 'English',
                onTap: () => selectLanguage(const Locale('en')),
                color: cardColor,
                textColor: textColor,
              ),
              const SizedBox(height: 16),
              _LanguageTile(
                flag: '🇺🇿',
                title: "O'zbekcha",
                onTap: () => selectLanguage(const Locale('uz')),
                color: cardColor,
                textColor: textColor,
              ),
              const SizedBox(height: 16),
              _LanguageTile(
                flag: '🇷🇺',
                title: 'Русский',
                onTap: () => selectLanguage(const Locale('ru')),
                color: cardColor,
                textColor: textColor,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String flag;
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  const _LanguageTile({
    required this.flag,
    required this.title,
    required this.onTap,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: TBSColors.shadow(context),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: TBSColors.textSecondary(context)),
          ],
        ),
      ),
    );
  }
}
