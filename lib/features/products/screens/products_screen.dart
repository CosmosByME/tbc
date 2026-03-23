/// Products screen for the TBS Bank app.
///
/// Displays the featured Platinum Visa banner, High-Yield Savings,
/// Personal Loans, Digital Assets crypto section, and Insurance & More grid.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/featured_card_banner.dart';
import '../widgets/product_tile.dart';
import '../widgets/crypto_section.dart';
import '../widgets/insurance_grid.dart';

/// Products tab screen — financial products and offerings.
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
                  Text(
                    'TBS Bank',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
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
              const SizedBox(height: 20),
              // Page title
              Text(
                'Products',
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Making it simpler with financial tools built around your lifestyle.',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              // Featured card
              const FeaturedCardBanner(),
              const SizedBox(height: 16),
              // High-Yield Savings
              ProductTile(
                icon: Icons.savings_outlined,
                iconColor: AppColors.accent,
                title: 'High-Yield Savings',
                subtitle:
                    'Grow your savings at 4.5% APY with no minimum balance and no fees to go with it.',
                highlightValue: '4.5%',
                highlightLabel: 'APY',
                onTap: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              // Personal Loans
              ProductTile(
                icon: Icons.account_balance_outlined,
                iconColor: AppColors.accentBlue,
                title: 'Personal Loans',
                subtitle:
                    'Instant approval for values up to \$50,000 with competitive fixed rates.',
                highlightValue: '5.9%',
                highlightLabel: 'APR',
                onTap: () => _showComingSoon(context),
              ),
              const SizedBox(height: 16),
              // Digital Assets / Crypto
              CryptoSection(
                onExplore: () => _showComingSoon(context),
              ),
              const SizedBox(height: 24),
              // Insurance & More grid
              const InsuranceGrid(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
