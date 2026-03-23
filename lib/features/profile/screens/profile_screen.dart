/// Profile screen — localized and dark-mode aware.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../widgets/profile_header.dart';
import '../widgets/menu_tile.dart';
import '../widgets/settings_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: TBSColors.card(context),
        title: Text(l10n.logoutTitle,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                color: TBSColors.textPrimary(context))),
        content: Text(l10n.logoutBody,
            style: GoogleFonts.inter(color: TBSColors.textSecondary(context))),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel,
                style: GoogleFonts.inter(
                    color: TBSColors.textSecondary(context))),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(l10n.loggedOut,
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
                behavior: SnackBarBehavior.floating,
                backgroundColor: AppColors.primary,
              ));
            },
            child: Text(l10n.logout,
                style: GoogleFonts.inter(
                    color: AppColors.expense,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cardColor = TBSColors.card(context);

    return Scaffold(
      backgroundColor: TBSColors.background(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.appName,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: TBSColors.textPrimary(context))),
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
                    child: Icon(Icons.settings_outlined,
                        color: TBSColors.textPrimary(context), size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const ProfileHeader(),
              const SizedBox(height: 28),
              // Account menu
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    MenuTile(
                        icon: Icons.people_outline,
                        title: l10n.tbsFriends,
                        iconColor: AppColors.accentBlue,
                        onTap: () {}),
                    MenuTile(
                        icon: Icons.description_outlined,
                        title: l10n.orderCerts,
                        iconColor: AppColors.accentBlue,
                        onTap: () {}),
                    MenuTile(
                        icon: Icons.handshake_outlined,
                        title: l10n.agreements,
                        iconColor: AppColors.accentBlue,
                        onTap: () {}),
                    MenuTile(
                        icon: Icons.person_outline,
                        title: l10n.personalData,
                        iconColor: AppColors.accentBlue,
                        showDivider: false,
                        onTap: () {}),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Settings section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16)),
                child: const SettingsSection(),
              ),
              const SizedBox(height: 20),
              // Logout
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16)),
                child: MenuTile(
                  icon: Icons.logout,
                  title: l10n.logout,
                  isDestructive: true,
                  iconColor: AppColors.expense,
                  showDivider: false,
                  onTap: () => _showLogoutDialog(context),
                ),
              ),
              const SizedBox(height: 28),
              Text(l10n.footerCopyright,
                  style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: TBSColors.textSecondary(context),
                      letterSpacing: 0.5)),
              const SizedBox(height: 4),
              Text(l10n.versionText,
                  style: GoogleFonts.inter(
                      fontSize: 11,
                      color: TBSColors.textSecondary(context))),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
