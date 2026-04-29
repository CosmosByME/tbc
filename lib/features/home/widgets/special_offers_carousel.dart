/// Special offers carousel — dark mode aware for the light cashback card.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/l10n/app_localizations.dart';

class SpecialOffersCarousel extends StatelessWidget {
  const SpecialOffersCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.specialOffers,
            style: GoogleFonts.inter(
                fontSize: 18, fontWeight: FontWeight.w600,
                color: TBSColors.textPrimary(context))),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: [
              _OsmonCardOffer(l10n: l10n),
              const SizedBox(width: 12),
              _CashbackOffer(l10n: l10n),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class _OsmonCardOffer extends StatelessWidget {
  const _OsmonCardOffer({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFF1A1A2E), Color(0xFF2D2D4E)],
            begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(color: AppColors.accent,
              borderRadius: BorderRadius.circular(6)),
          child: Text('New', style: GoogleFonts.inter(
              fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white)),
        ),
        const SizedBox(height: 10),
        Text('Order Osmon Card', style: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
        const SizedBox(height: 4),
        Text('Up to 5% on grocery stores',
            style: GoogleFonts.inter(fontSize: 12, color: Colors.white70)),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: AppColors.accent, borderRadius: BorderRadius.circular(8)),
          child: Text(l10n.getNow, style: GoogleFonts.inter(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
        ),
      ]),
    );
  }
}

class _CashbackOffer extends StatelessWidget {
  const _CashbackOffer({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TBSColors.card(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: TBSColors.divider(context)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
              color: AppColors.accentBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6)),
          child: Text('Cashback', style: GoogleFonts.inter(
              fontSize: 10, fontWeight: FontWeight.w600,
              color: AppColors.accentBlue)),
        ),
        const SizedBox(height: 10),
        Text('0% purchases\nup to 55 days', style: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w700,
            color: TBSColors.textPrimary(context))),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: AppColors.accentBlue,
              borderRadius: BorderRadius.circular(8)),
          child: Text(l10n.activate, style: GoogleFonts.inter(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
        ),
      ]),
    );
  }
}
