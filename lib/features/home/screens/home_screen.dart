/// Home screen for the TBS Bank app.
///
/// Displays the balance card, quick action buttons, spending manager
/// bar chart, and special offers carousel in a scrollable layout.
/// The app bar shows "TBS Bank" branding and a notification bell icon.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/balance_card.dart';
import '../widgets/quick_actions_row.dart';
import '../widgets/spending_manager_card.dart';
import '../widgets/special_offers_carousel.dart';

/// Main home tab screen.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      // TBS logo circle
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'T',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
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
                  // Notification bell
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
              // Balance card
              const BalanceCard(),
              const SizedBox(height: 24),
              // Quick actions
              const QuickActionsRow(),
              const SizedBox(height: 24),
              // Spending manager chart
              const SpendingManagerCard(),
              const SizedBox(height: 24),
              // Special offers
              const SpecialOffersCarousel(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
