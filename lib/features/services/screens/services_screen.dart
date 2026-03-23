/// Services screen for the TBS Bank app.
///
/// Accessible via "Explore Cards" / "Compare Tiers" from the Home screen.
/// Displays: hero banner, Elite Credit Cards, Growth Deposits,
/// Personal & Home Loans, Wealth Management, and Digital Vault.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/credit_card_section.dart';
import '../widgets/deposit_card.dart';
import '../widgets/loan_section.dart';
import '../widgets/vault_tile.dart';

/// Services screen pushed via Navigator from Home.
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Coming soon!',
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCard,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // App bar row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'TBS Bank',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Hero banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ELEVATE YOUR FINANCES',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Banking services\ntailored to your\nambition.',
                      style: GoogleFonts.inter(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Elite Credit Cards
              CreditCardSection(
                onExploreCards: () => _showComingSoon(context),
                onCompareTiers: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              // Growth Deposits
              DepositCard(
                onOpenAccount: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              // Personal & Home Loans
              LoanSection(
                onApplyLoan: () => _showComingSoon(context),
                onMortgageCalc: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              // Wealth Management
              VaultTile(
                icon: Icons.trending_up,
                iconColor: AppColors.primary,
                title: 'Wealth Management',
                description:
                    'Grow your portfolio managed by industry experts. Build your future with TBS World services.',
                ctaText: 'Consult an Advisor →',
                onTap: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              // Digital Vault
              VaultTile(
                icon: Icons.lock_outline,
                iconColor: AppColors.expense,
                title: 'Digital Vault',
                description:
                    'Store and access sensitive documents in bank-grade encrypted and biometric authenticated storage.',
                ctaText: 'Manage Documents →',
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
