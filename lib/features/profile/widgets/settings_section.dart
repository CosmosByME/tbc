/// Settings section widget for the Profile screen.
///
/// Groups app settings items: Notifications, Security, Language, Appearance.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import 'menu_tile.dart';

/// App Settings section containing notification, security, language,
/// and appearance toggles.
class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Settings',
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        MenuTile(
          icon: Icons.notifications_outlined,
          title: 'Notifications',
          onTap: () {},
        ),
        MenuTile(
          icon: Icons.lock_outline,
          title: 'Security',
          onTap: () {},
        ),
        MenuTile(
          icon: Icons.language,
          title: 'Language',
          trailingText: 'English US',
          onTap: () {},
        ),
        MenuTile(
          icon: Icons.palette_outlined,
          title: 'Appearance',
          showDivider: false,
          onTap: () {},
        ),
      ],
    );
  }
}
