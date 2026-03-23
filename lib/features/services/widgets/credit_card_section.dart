/// Credit card section — dark mode aware card container.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/l10n/app_localizations.dart';

class CreditCardSection extends StatelessWidget {
  final VoidCallback onExploreCards;
  final VoidCallback onCompareTiers;

  const CreditCardSection(
      {super.key, required this.onExploreCards, required this.onCompareTiers});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TBSColors.card(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(
            color: TBSColors.shadow(context), blurRadius: 12,
            offset: const Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.credit_card, color: TBSColors.textPrimary(context), size: 20),
          const SizedBox(width: 8),
          Text(l10n.eliteCreditCards, style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w700,
              color: TBSColors.textPrimary(context))),
        ]),
        const SizedBox(height: 12),
        Text(l10n.eliteCardsDesc,
            style: GoogleFonts.inter(fontSize: 13,
                color: TBSColors.textSecondary(context), height: 1.5)),
        const SizedBox(height: 16),
        _bullet(context, '0% APR for 12 months'),
        const SizedBox(height: 8),
        _bullet(context, 'Global Lounge Access'),
        const SizedBox(height: 20),
        Row(children: [
          Expanded(child: ElevatedButton(
            onPressed: onExploreCards,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent, foregroundColor: Colors.white,
                elevation: 0, padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(l10n.exploreCards, style: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600)),
          )),
          const SizedBox(width: 12),
          Expanded(child: OutlinedButton(
            onPressed: onCompareTiers,
            style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.accent,
                side: const BorderSide(color: AppColors.accent),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(l10n.compareTiers, style: GoogleFonts.inter(
                fontSize: 14, fontWeight: FontWeight.w600)),
          )),
        ]),
      ]),
    );
  }

  Widget _bullet(BuildContext context, String text) => Row(children: [
    Container(width: 6, height: 6,
        decoration: const BoxDecoration(
            color: AppColors.accent, shape: BoxShape.circle)),
    const SizedBox(width: 10),
    Text(text, style: GoogleFonts.inter(fontSize: 13,
        fontWeight: FontWeight.w500,
        color: TBSColors.textPrimary(context))),
  ]);
}
