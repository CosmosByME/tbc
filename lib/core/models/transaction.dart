/// Data model for a single financial transaction.
///
/// Used across the History screens (both USD and UZS) to represent
/// deposits, payments, transfers, and other account activity.
import 'package:flutter/material.dart';

/// Immutable transaction record.
class Transaction {
  /// Creates a [Transaction] with all required fields.
  const Transaction({
    required this.id,
    required this.merchantName,
    required this.category,
    required this.amount,
    required this.currency,
    required this.date,
    required this.time,
    required this.icon,
    required this.iconColor,
    this.isIncome = false,
  });

  /// Unique identifier.
  final String id;

  /// Merchant or sender name displayed as the title.
  final String merchantName;

  /// Category label — e.g. "Grocery", "Dining", "Income".
  final String category;

  /// Signed amount — negative for expenses, positive for income.
  final double amount;

  /// Currency code — "USD" or "UZS".
  final String currency;

  /// Date string used for grouping — e.g. "Today · Oct 24".
  final String date;

  /// Time string — e.g. "14:32".
  final String time;

  /// Leading icon for the category.
  final IconData icon;

  /// Background color of the icon circle.
  final Color iconColor;

  /// Whether this transaction is income (green) or expense (red).
  final bool isIncome;
}
