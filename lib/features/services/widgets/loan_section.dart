/// Loan section — dark mode aware.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/l10n/app_localizations.dart';

class LoanSection extends StatelessWidget {
  final VoidCallback onApplyLoan;
  final VoidCallback onMortgageCalc;

  const LoanSection(
      {super.key, required this.onApplyLoan, required this.onMortgageCalc});

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
        Text(l10n.personalHomeLoans, style: GoogleFonts.inter(fontSize: 18,
            fontWeight: FontWeight.w700, color: TBSColors.textPrimary(context))),
        const SizedBox(height: 8),
        Text(l10n.loansDesc,
            style: GoogleFonts.inter(fontSize: 13,
                color: TBSColors.textSecondary(context), height: 1.5)),
        const SizedBox(height: 16),
        Row(children: [
          _statBox(context, 'MORTGAGE RATE', '3.2%', 'Fixed'),
          const SizedBox(width: 16),
          _statBox(context, 'PERSONAL LOANS UP TO', '\$100K', ''),
        ]),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: onApplyLoan,
            style: OutlinedButton.styleFrom(
                foregroundColor: TBSColors.textPrimary(context),
                side: BorderSide(color: TBSColors.divider(context)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(l10n.applyForLoan, style: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onMortgageCalc,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.expense,
                foregroundColor: Colors.white, elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(l10n.mortgageCalc, style: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600)),
          ),
        ),
      ]),
    );
  }

  Widget _statBox(BuildContext context, String label, String value, String sub) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: TBSColors.cardAlt(context),
          borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: GoogleFonts.inter(fontSize: 9,
            fontWeight: FontWeight.w600,
            color: TBSColors.textSecondary(context), letterSpacing: 0.5)),
        const SizedBox(height: 4),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(value, style: GoogleFonts.inter(fontSize: 22,
              fontWeight: FontWeight.w700,
              color: TBSColors.textPrimary(context))),
          if (sub.isNotEmpty) ...[
            const SizedBox(width: 4),
            Padding(padding: const EdgeInsets.only(bottom: 3),
                child: Text(sub, style: GoogleFonts.inter(fontSize: 12,
                    color: TBSColors.textSecondary(context)))),
          ],
        ]),
      ]),
    ));
  }
}
