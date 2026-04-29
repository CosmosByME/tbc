/// Menu tile widget — dark mode aware text colors.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.trailingText,
    this.onTap,
    this.showDivider = true,
    this.iconColor,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final String? trailingText;
  final VoidCallback? onTap;
  final bool showDivider;
  final Color? iconColor;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ??
        (isDestructive ? AppColors.expense : TBSColors.textPrimary(context));

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                Icon(icon, color: effectiveIconColor, size: 22),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: isDestructive
                          ? AppColors.expense
                          : TBSColors.textPrimary(context),
                    ),
                  ),
                ),
                ?trailing,
                if (trailing == null && trailingText != null)
                  Text(
                    trailingText!,
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        color: TBSColors.textSecondary(context)),
                  ),
                if (!isDestructive) ...[
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios,
                      size: 14,
                      color: TBSColors.textSecondary(context)),
                ],
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(height: 1, color: TBSColors.divider(context)),
      ],
    );
  }
}
