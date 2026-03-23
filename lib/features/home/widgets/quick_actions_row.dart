/// Quick actions row — dark mode aware icon backgrounds.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/l10n/app_localizations.dart';

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _QuickActionItem(icon: Icons.payment, label: l10n.payments),
        _QuickActionItem(icon: Icons.swap_horiz, label: l10n.transfers),
        _QuickActionItem(icon: Icons.qr_code_scanner, label: l10n.qrPay),
        _QuickActionItem(icon: Icons.calculate_outlined, label: l10n.hisobKitob),
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  const _QuickActionItem({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 52, height: 52,
          decoration: BoxDecoration(
            color: TBSColors.iconBg(context, AppColors.accentBlue),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.accentBlue, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: GoogleFonts.inter(
                fontSize: 12, fontWeight: FontWeight.w500,
                color: TBSColors.textPrimary(context))),
      ],
    );
  }
}
