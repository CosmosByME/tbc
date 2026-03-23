/// Products screen — dark mode aware and localized.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../widgets/featured_card_banner.dart';
import '../widgets/product_tile.dart';
import '../widgets/crypto_section.dart';
import '../widgets/insurance_grid.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  void _showComingSoon(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(l10n.comingSoon,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.primary,
      duration: const Duration(seconds: 2),
    ));
  }

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
                  Text(l10n.appName, style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w700,
                      color: TBSColors.textPrimary(context))),
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                        color: TBSColors.card(context), shape: BoxShape.circle,
                        boxShadow: [BoxShadow(
                            color: TBSColors.shadow(context), blurRadius: 8)]),
                    child: Icon(Icons.notifications_outlined,
                        color: TBSColors.textPrimary(context), size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(l10n.products, style: GoogleFonts.inter(
                  fontSize: 28, fontWeight: FontWeight.w700,
                  color: TBSColors.textPrimary(context))),
              const SizedBox(height: 4),
              Text('Making it simpler with financial tools built around your lifestyle.',
                  style: GoogleFonts.inter(fontSize: 14,
                      color: TBSColors.textSecondary(context), height: 1.4)),
              const SizedBox(height: 24),
              const FeaturedCardBanner(),
              const SizedBox(height: 16),
              ProductTile(
                icon: Icons.savings_outlined, iconColor: AppColors.accent,
                title: l10n.highYieldSavings,
                subtitle: l10n.highYieldSavingsDesc,
                highlightValue: '4.5%', highlightLabel: 'APY',
                onTap: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              ProductTile(
                icon: Icons.account_balance_outlined,
                iconColor: AppColors.accentBlue,
                title: l10n.personalLoansProduct,
                subtitle: l10n.personalLoansProductDesc,
                highlightValue: '5.9%', highlightLabel: 'APR',
                onTap: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              CryptoSection(onExplore: () => _showComingSoon(context)),
              const SizedBox(height: 24),
              InsuranceGrid(l10n: l10n),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
