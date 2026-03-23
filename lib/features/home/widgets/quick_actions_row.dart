/// Quick actions row widget for the Home screen.
///
/// Displays four equally spaced circular icon buttons:
/// Payments, Transfers, QR Pay, and Hisob-Kitob.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

/// Row of four quick-action buttons with icon + label.
class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _QuickActionItem(
          icon: Icons.payment,
          label: 'Payments',
        ),
        _QuickActionItem(
          icon: Icons.swap_horiz,
          label: 'Transfers',
        ),
        _QuickActionItem(
          icon: Icons.qr_code_scanner,
          label: 'QR Pay',
        ),
        _QuickActionItem(
          icon: Icons.calculate_outlined,
          label: 'Hisob-Kitob',
        ),
      ],
    );
  }
}

/// Single quick-action item: circular icon on tinted background + label.
class _QuickActionItem extends StatelessWidget {
  const _QuickActionItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.accentBlue.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.accentBlue,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
