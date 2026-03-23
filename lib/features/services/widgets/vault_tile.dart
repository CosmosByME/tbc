/// Vault tile — dark mode aware.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';

class VaultTile extends StatelessWidget {
  const VaultTile({
    super.key, required this.icon, required this.iconColor,
    required this.title, required this.description,
    required this.ctaText, this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String ctaText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: TBSColors.card(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: TBSColors.shadow(context), blurRadius: 12,
            offset: const Offset(0, 4))],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(
              color: TBSColors.iconBg(context, iconColor),
              borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(title, style: GoogleFonts.inter(fontSize: 16,
              fontWeight: FontWeight.w700,
              color: TBSColors.textPrimary(context))),
          const SizedBox(height: 6),
          Text(description, style: GoogleFonts.inter(fontSize: 13,
              color: TBSColors.textSecondary(context), height: 1.4)),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onTap,
            child: Text(ctaText, style: GoogleFonts.inter(fontSize: 13,
                fontWeight: FontWeight.w600, color: AppColors.accentBlue)),
          ),
        ])),
      ]),
    );
  }
}
