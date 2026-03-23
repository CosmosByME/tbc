/// Transaction list item — dark mode aware text colors.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({super.key, required this.transaction});
  final Transaction transaction;

  String _formatUzs(int amount) {
    final str = amount.toString();
    final buf = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) buf.write(',');
      buf.write(str[i]);
    }
    return buf.toString();
  }

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.isIncome;
    final amountColor = isIncome ? AppColors.income : AppColors.expense;
    String amountText;
    if (transaction.currency == 'UZS') {
      final formatted = _formatUzs(transaction.amount.abs().toInt());
      amountText = '${isIncome ? '+' : '-'} $formatted UZS';
    } else {
      amountText = '${isIncome ? '+' : '-'}\$'
          '${transaction.amount.abs().toStringAsFixed(2)}';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(
              color: TBSColors.iconBg(context, transaction.iconColor),
              shape: BoxShape.circle),
          child: Icon(transaction.icon,
              color: transaction.iconColor, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(transaction.merchantName, style: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w600,
              color: TBSColors.textPrimary(context))),
          const SizedBox(height: 3),
          Text('${transaction.time} · ${transaction.category}',
              style: GoogleFonts.inter(fontSize: 12,
                  color: TBSColors.textSecondary(context))),
        ])),
        Text(amountText, style: GoogleFonts.inter(
            fontSize: 14, fontWeight: FontWeight.w600, color: amountColor)),
      ]),
    );
  }
}
