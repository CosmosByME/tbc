/// Adaptive color helpers that switch between light and dark palettes
/// based on the current [ThemeData.brightness].
///
/// Use instead of raw [AppColors] for any colors that should adapt to dark mode.
import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Returns context-sensitive colors for light/dark mode.
class TBSColors {
  TBSColors._();

  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  /// Scaffold / page background.
  static Color background(BuildContext context) =>
      _isDark(context) ? const Color(0xFF0A0A1A) : AppColors.surfaceCard;

  /// Primary card surface (white in light, dark navy in dark).
  static Color card(BuildContext context) =>
      _isDark(context) ? const Color(0xFF161626) : AppColors.surface;

  /// Secondary / nested card surface.
  static Color cardAlt(BuildContext context) =>
      _isDark(context) ? const Color(0xFF1E1E35) : AppColors.surfaceCard;

  /// Primary text.
  static Color textPrimary(BuildContext context) =>
      _isDark(context) ? const Color(0xFFF0F2F8) : AppColors.textPrimary;

  /// Secondary / muted text.
  static Color textSecondary(BuildContext context) =>
      _isDark(context) ? const Color(0xFF8A94A6) : AppColors.textSecondary;

  /// Divider line.
  static Color divider(BuildContext context) =>
      _isDark(context) ? const Color(0xFF252540) : AppColors.divider;

  /// Card shadow — transparent in dark mode.
  static Color shadow(BuildContext context) =>
      _isDark(context)
          ? Colors.transparent
          : Colors.black.withValues(alpha: 0.04);

  /// Subtle icon container background.
  static Color iconBg(BuildContext context, Color iconColor) =>
      iconColor.withValues(alpha: _isDark(context) ? 0.2 : 0.1);
}
