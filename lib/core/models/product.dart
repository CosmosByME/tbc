/// Data model for financial products and cards.
///
/// Used on the Products screen and Services screen to represent
/// credit cards, savings accounts, loans, insurance, and other offerings.
import 'package:flutter/material.dart';

/// Immutable product/card record.
class Product {
  /// Creates a [Product] with all required fields.
  const Product({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.description = '',
    this.highlightValue = '',
    this.highlightLabel = '',
    this.ctaText = '',
  });

  /// Unique identifier.
  final String id;

  /// Product name — e.g. "High-Yield Savings".
  final String title;

  /// Short tagline or description shown below the title.
  final String subtitle;

  /// Leading icon.
  final IconData icon;

  /// Icon container color.
  final Color iconColor;

  /// Longer description text.
  final String description;

  /// Highlighted metric value — e.g. "4.5%".
  final String highlightValue;

  /// Label for the highlight — e.g. "APY".
  final String highlightLabel;

  /// Call-to-action button text.
  final String ctaText;
}
