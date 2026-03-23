/// Menu tile widget for the Profile screen.
///
/// A tappable row with leading icon, title, optional trailing
/// value/widget, and a forward chevron. Used for settings items,
/// TBS Friends, Agreements, etc.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

/// A single tappable menu item row.
class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.trailingText,
    this.onTap,
    this.showDivider = true,
    this.iconColor = AppColors.textPrimary,
    this.isDestructive = false,
  });

  /// Leading icon.
  final IconData icon;

  /// Menu item label.
  final String title;

  /// Optional trailing widget (overrides trailingText).
  final Widget? trailing;

  /// Optional trailing text value (e.g. "English US").
  final String? trailingText;

  /// Tap callback.
  final VoidCallback? onTap;

  /// Whether to show a bottom divider.
  final bool showDivider;

  /// Icon color.
  final Color iconColor;

  /// If true, the title renders in red (e.g. Logout).
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 22),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: isDestructive
                          ? AppColors.expense
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
                if (trailing == null && trailingText != null)
                  Text(
                    trailingText!,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                if (!isDestructive) ...[
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                ],
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(height: 1, color: AppColors.divider),
      ],
    );
  }
}
