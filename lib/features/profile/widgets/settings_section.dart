/// Settings section widget for the Profile screen.
///
/// Appearance and Language tiles open modal bottom sheets allowing
/// the user to pick a theme mode or language. Changes take effect
/// immediately by updating [AppNotifier] via [AppState].
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/state/app_state.dart';
import '../../../../core/l10n/app_localizations.dart';
import 'menu_tile.dart';

/// App Settings section with interactive Appearance and Language pickers.
class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  // ── Appearance Bottom Sheet ─────────────────────────────────────────────

  void _showAppearanceSheet(BuildContext context) {
    final notifier = AppState.of(context);
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: TBSColors.card(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _PickerSheet(
        title: l10n.appearance,
        options: [
          _PickerOption(
            icon: Icons.light_mode_outlined,
            label: l10n.themeLight,
            isSelected: notifier.themeMode == ThemeMode.light,
            onTap: () {
              notifier.setThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
          ),
          _PickerOption(
            icon: Icons.dark_mode_outlined,
            label: l10n.themeDark,
            isSelected: notifier.themeMode == ThemeMode.dark,
            onTap: () {
              notifier.setThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
          ),
          _PickerOption(
            icon: Icons.brightness_auto_outlined,
            label: l10n.themeSystem,
            isSelected: notifier.themeMode == ThemeMode.system,
            onTap: () {
              notifier.setThemeMode(ThemeMode.system);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // ── Language Bottom Sheet ───────────────────────────────────────────────

  void _showLanguageSheet(BuildContext context) {
    final notifier = AppState.of(context);
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: TBSColors.card(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _PickerSheet(
        title: l10n.language,
        options: [
          _PickerOption(
            flagEmoji: '🇺🇸',
            label: l10n.langEnglish,
            isSelected: notifier.locale.languageCode == 'en',
            onTap: () {
              notifier.setLocale(const Locale('en'));
              Navigator.pop(context);
            },
          ),
          _PickerOption(
            flagEmoji: '🇺🇿',
            label: l10n.langUzbek,
            isSelected: notifier.locale.languageCode == 'uz',
            onTap: () {
              notifier.setLocale(const Locale('uz'));
              Navigator.pop(context);
            },
          ),
          _PickerOption(
            flagEmoji: '🇷🇺',
            label: l10n.langRussian,
            isSelected: notifier.locale.languageCode == 'ru',
            onTap: () {
              notifier.setLocale(const Locale('ru'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final notifier = AppState.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.appSettings,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: TBSColors.textSecondary(context),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        MenuTile(
          icon: Icons.notifications_outlined,
          title: l10n.notifications,
          onTap: () {},
        ),
        MenuTile(
          icon: Icons.lock_outline,
          title: l10n.security,
          onTap: () {},
        ),
        // Language — shows current language, opens picker sheet
        MenuTile(
          icon: Icons.language,
          title: l10n.language,
          trailingText: l10n.currentLangLabel,
          onTap: () => _showLanguageSheet(context),
        ),
        // Appearance — shows current theme, opens picker sheet
        MenuTile(
          icon: Icons.palette_outlined,
          title: l10n.appearance,
          trailingText: l10n.themeModeLabel(notifier.themeMode),
          showDivider: false,
          onTap: () => _showAppearanceSheet(context),
        ),
      ],
    );
  }
}

// ── Bottom Sheet Widgets ────────────────────────────────────────────────────

/// The modal bottom sheet container with title and list of options.
class _PickerSheet extends StatelessWidget {
  const _PickerSheet({required this.title, required this.options});
  final String title;
  final List<_PickerOption> options;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: TBSColors.divider(context),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Title
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: TBSColors.textPrimary(context),
            ),
          ),
          const SizedBox(height: 16),
          // Options
          ...options.map((opt) => _OptionRow(option: opt)),
        ],
      ),
    );
  }
}

/// A single selectable option row in the picker sheet.
class _OptionRow extends StatelessWidget {
  const _OptionRow({required this.option});
  final _PickerOption option;

  @override
  Widget build(BuildContext context) {
    final isSelected = option.isSelected;
    return InkWell(
      onTap: option.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withValues(alpha: 0.1)
              : TBSColors.cardAlt(context),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: AppColors.accent, width: 1.5)
              : null,
        ),
        child: Row(
          children: [
            // Flag emoji or icon
            option.flagEmoji != null
                ? Text(option.flagEmoji!, style: const TextStyle(fontSize: 22))
                : Icon(option.icon,
                    color: isSelected
                        ? AppColors.accent
                        : TBSColors.textSecondary(context),
                    size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                option.label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected
                      ? AppColors.accent
                      : TBSColors.textPrimary(context),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle_rounded,
                  color: AppColors.accent, size: 20),
          ],
        ),
      ),
    );
  }
}

/// Data class for a picker sheet option.
class _PickerOption {
  const _PickerOption({
    this.icon = Icons.circle,
    this.flagEmoji,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final IconData icon;
  final String? flagEmoji;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
}
