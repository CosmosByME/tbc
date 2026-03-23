/// Product tile — dark mode aware card surface.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key, required this.icon, required this.iconColor,
    required this.title, required this.subtitle,
    this.highlightValue = '', this.highlightLabel = '', this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String highlightValue;
  final String highlightLabel;
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
                color: TBSColors.iconBg(context, iconColor),
                borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 32, height: 32,
              decoration: BoxDecoration(
                  color: TBSColors.cardAlt(context), shape: BoxShape.circle),
              child: Icon(Icons.add, color: TBSColors.textPrimary(context),
                  size: 18),
            ),
          ),
        ]),
        const SizedBox(height: 14),
        Text(title, style: GoogleFonts.inter(fontSize: 17,
            fontWeight: FontWeight.w700, color: TBSColors.textPrimary(context))),
        const SizedBox(height: 6),
        Text(subtitle, style: GoogleFonts.inter(fontSize: 13,
            color: TBSColors.textSecondary(context), height: 1.4)),
        if (highlightValue.isNotEmpty) ...[
          const SizedBox(height: 14),
          Row(crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic, children: [
            Text(highlightValue, style: GoogleFonts.inter(fontSize: 24,
                fontWeight: FontWeight.w700, color: AppColors.accent)),
            const SizedBox(width: 6),
            Text(highlightLabel, style: GoogleFonts.inter(fontSize: 14,
                fontWeight: FontWeight.w500,
                color: TBSColors.textSecondary(context))),
          ]),
        ],
      ]),
    );
  }
}
