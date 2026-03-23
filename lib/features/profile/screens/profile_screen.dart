/// Profile screen for the TBS Bank app.
///
/// Displays user profile with avatar, verified badge, account menu items
/// (TBS Friends, Order Certificates, Agreements, Personal Data),
/// app settings section, logout button, and footer with version info.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/profile_header.dart';
import '../widgets/menu_tile.dart';
import '../widgets/settings_section.dart';

/// Profile tab screen — user account and settings.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  /// Shows a logout confirmation dialog.
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Logout',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: GoogleFonts.inter(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Cancel',
              style: GoogleFonts.inter(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              // Reset to home tab — walk up to MainNavigation
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Logged out successfully',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColors.primary,
                ),
              );
            },
            child: Text(
              'Logout',
              style: GoogleFonts.inter(
                color: AppColors.expense,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
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
                      Icons.settings_outlined,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Profile header
              const ProfileHeader(),
              const SizedBox(height: 28),
              // Account menu items
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    MenuTile(
                      icon: Icons.people_outline,
                      title: 'TBS Friends',
                      iconColor: AppColors.accentBlue,
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.description_outlined,
                      title: 'Order certificates',
                      iconColor: AppColors.accentBlue,
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.handshake_outlined,
                      title: 'Agreements',
                      iconColor: AppColors.accentBlue,
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.person_outline,
                      title: 'Personal data',
                      iconColor: AppColors.accentBlue,
                      showDivider: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Settings section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SettingsSection(),
              ),
              const SizedBox(height: 20),
              // Logout button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: MenuTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  isDestructive: true,
                  iconColor: AppColors.expense,
                  showDivider: false,
                  onTap: () => _showLogoutDialog(context),
                ),
              ),
              const SizedBox(height: 28),
              // Footer
              Text(
                'TBS BANK INTERNATIONAL © 2024',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Version 4.12.0 (Build 821)',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
