/// Defines all color constants used throughout the TBS Bank app.
///
/// Colors are extracted from the design system and include primary branding,
/// accent colors, surface tones, text colors, and semantic colors for
/// income/expense indicators.
import 'package:flutter/material.dart';

/// Central color palette for the TBS Bank application.
class AppColors {
  AppColors._();

  /// Deep navy — primary brand color, used for headers and dark backgrounds.
  static const primary = Color(0xFF1A1A2E);

  /// Mint green — call-to-action buttons, active/selected states, income.
  static const accent = Color(0xFF00D09C);

  /// Blue highlight — used for secondary accents and icon backgrounds.
  static const accentBlue = Color(0xFF4F8EF7);

  /// Pure white surface.
  static const surface = Color(0xFFFFFFFF);

  /// Light grey card background.
  static const surfaceCard = Color(0xFFF5F7FA);

  /// Primary text color (deep navy).
  static const textPrimary = Color(0xFF1A1A2E);

  /// Secondary/muted text color.
  static const textSecondary = Color(0xFF8A94A6);

  /// Green for positive/income amounts.
  static const income = Color(0xFF00D09C);

  /// Red for negative/expense amounts.
  static const expense = Color(0xFFFF5A5A);

  /// Thin divider/separator color.
  static const divider = Color(0xFFEEF0F4);

  /// Gold badge color for premium labels.
  static const gold = Color(0xFFD4A843);
}
