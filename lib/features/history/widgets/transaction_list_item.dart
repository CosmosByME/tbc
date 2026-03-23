/// Transaction list item widget for the History screen.
///
/// Displays a single transaction row with leading category icon,
/// merchant name, time + category label, and amount colored
/// green (income) or red (expense).
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/models/transaction.dart';

/// Single transaction row in the history list.
class TransactionListItem extends StatelessWidget {
  const TransactionListItem({super.key, required this.transaction});

  /// The transaction data to display.
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.isIncome;
    final amountColor = isIncome ? AppColors.income : AppColors.expense;

    // Format the amount string.
    String amountText;
    if (transaction.currency == 'UZS') {
      final absAmount = transaction.amount.abs().toInt();
      final formatted = _formatUzs(absAmount);
      amountText = '${isIncome ? '+' : '-'} $formatted UZS';
    } else {
      amountText =
          '${isIncome ? '+' : '-'}\$${transaction.amount.abs().toStringAsFixed(2)}';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          // Icon circle
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: transaction.iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              transaction.icon,
              color: transaction.iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          // Name + category
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.merchantName,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${transaction.time} · ${transaction.category}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Amount
          Text(
            amountText,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Formats UZS amounts with thousand separators (e.g. 1,200,000).
  String _formatUzs(int amount) {
    final str = amount.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) buffer.write(',');
      buffer.write(str[i]);
    }
    return buffer.toString();
  }
}
