/// Profile header — dark mode aware, localized verified badge.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/state/app_state.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final userName = AppState.of(context).userName ?? 'Alexander Bennett';
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: TBSColors.cardAlt(context),
            border: Border.all(color: AppColors.accent, width: 2),
          ),
          child: Icon(Icons.person, size: 40,
              color: TBSColors.textPrimary(context)),
        ),
        const SizedBox(height: 14),
        Text(userName,
            style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: TBSColors.textPrimary(context))),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.verified, size: 16, color: AppColors.accent),
              const SizedBox(width: 6),
              Text(l10n.identityVerified,
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.accent)),
            ],
          ),
        ),
      ],
    );
  }
}
