import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/l10n/app_localizations.dart';

class TotalBalanceWidget extends StatelessWidget {
  final double amount;
  final bool isVisible;
  final VoidCallback onToggleVisibility;

  const TotalBalanceWidget({
    super.key,
    required this.amount,
    required this.isVisible,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    // Formatting currency simply for prototype
    final formattedAmount = isVisible 
        ? '\$${amount.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'
        : '*****';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.totalBalance,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: TBSColors.textSecondary(context),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formattedAmount,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: TBSColors.textPrimary(context),
              ),
            ),
            GestureDetector(
              onTap: onToggleVisibility,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: TBSColors.cardAlt(context),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: TBSColors.textPrimary(context),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
