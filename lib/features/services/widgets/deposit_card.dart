/// Deposit card — dark mode aware.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/l10n/app_localizations.dart';

class DepositCard extends StatelessWidget {
  final VoidCallback onOpenAccount;
  const DepositCard({super.key, required this.onOpenAccount});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TBSColors.card(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: TBSColors.shadow(context), blurRadius: 12,
            offset: const Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(l10n.highYieldLabel, style: GoogleFonts.inter(fontSize: 11,
            fontWeight: FontWeight.w600, color: AppColors.accent,
            letterSpacing: 1.2)),
        const SizedBox(height: 8),
        Text(l10n.growthDeposits, style: GoogleFonts.inter(fontSize: 20,
            fontWeight: FontWeight.w700, color: TBSColors.textPrimary(context))),
        const SizedBox(height: 8),
        Row(crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic, children: [
          Text('4.85%', style: GoogleFonts.inter(fontSize: 36,
              fontWeight: FontWeight.w700, color: AppColors.accent)),
          const SizedBox(width: 8),
          Text('APY', style: GoogleFonts.inter(fontSize: 16,
              fontWeight: FontWeight.w500,
              color: TBSColors.textSecondary(context))),
        ]),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onOpenAccount,
            icon: const Icon(Icons.north_east, size: 18),
            label: Text(l10n.openAccount, style: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600)),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white, elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
      ]),
    );
  }
}
