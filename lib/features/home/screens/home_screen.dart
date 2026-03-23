/// Home screen — dark mode aware, localized app bar.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../widgets/balance_card.dart';
import '../widgets/quick_actions_row.dart';
import '../widgets/spending_manager_card.dart';
import '../widgets/special_offers_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: TBSColors.background(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('T',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(l10n.appName,
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: TBSColors.textPrimary(context))),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: TBSColors.card(context),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: TBSColors.shadow(context), blurRadius: 8)
                      ],
                    ),
                    child: Icon(Icons.notifications_outlined,
                        color: TBSColors.textPrimary(context), size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const BalanceCard(),
              const SizedBox(height: 24),
              const QuickActionsRow(),
              const SizedBox(height: 24),
              const SpendingManagerCard(),
              const SizedBox(height: 24),
              const SpecialOffersCarousel(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
