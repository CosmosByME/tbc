/// Date group header widget for the History screen.
///
/// Displays a date label (e.g. "TODAY · Oct 24") to separate
/// groups of transactions in the list.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

/// Section header showing a date label above transaction groups.
class DateGroupHeader extends StatelessWidget {
  const DateGroupHeader({super.key, required this.dateLabel});

  /// The formatted date string — e.g. "TODAY · Oct 24".
  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        dateLabel,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
