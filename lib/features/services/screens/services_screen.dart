/// Services screen — dark mode aware scaffold and containers.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../widgets/credit_card_section.dart';
import '../widgets/deposit_card.dart';
import '../widgets/loan_section.dart';
import '../widgets/vault_tile.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

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
                  Row(children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios, size: 20,
                          color: TBSColors.textPrimary(context)),
                    ),
                    const SizedBox(width: 8),
                    Text(l10n.appName,
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w700,
                            color: TBSColors.textPrimary(context))),
                  ]),
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
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('ELEVATE YOUR FINANCES',
                      style: GoogleFonts.inter(fontSize: 11,
                          fontWeight: FontWeight.w600, color: AppColors.accent,
                          letterSpacing: 1.5)),
                  const SizedBox(height: 10),
                  Text('Banking services\ntailored to your\nambition.',
                      style: GoogleFonts.inter(fontSize: 26,
                          fontWeight: FontWeight.w700, color: Colors.white,
                          height: 1.3)),
                ]),
              ),
              const SizedBox(height: 24),
              CreditCardSection(
                  onExploreCards: () => _showComingSoon(context),
                  onCompareTiers: () => _showComingSoon(context)),
              const SizedBox(height: 16),
              DepositCard(onOpenAccount: () => _showComingSoon(context)),
              const SizedBox(height: 16),
              LoanSection(
                  onApplyLoan: () => _showComingSoon(context),
                  onMortgageCalc: () => _showComingSoon(context)),
              const SizedBox(height: 16),
              VaultTile(
                icon: Icons.trending_up, iconColor: AppColors.accent,
                title: l10n.wealthManagement,
                description: l10n.wealthManagementDesc,
                ctaText: l10n.consultAdvisor,
                onTap: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              VaultTile(
                icon: Icons.lock_outline, iconColor: AppColors.expense,
                title: l10n.digitalVault,
                description: l10n.digitalVaultDesc,
                ctaText: l10n.manageDocuments,
                onTap: () => _showComingSoon(context),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
