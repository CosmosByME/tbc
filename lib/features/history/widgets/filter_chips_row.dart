/// Filter chips row widget for the History screen.
///
/// Displays a row of toggle-able filter chips for time range
/// and account type. Only one chip per group can be active.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

/// A row of single-select filter chips.
class FilterChipsRow extends StatelessWidget {
  const FilterChipsRow({
    super.key,
    required this.chips,
    required this.selectedIndex,
    required this.onSelected,
  });

  /// Labels for each chip.
  final List<String> chips;

  /// Currently selected chip index.
  final int selectedIndex;

  /// Callback when a chip is tapped.
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.accent : AppColors.surfaceCard,
                borderRadius: BorderRadius.circular(20),
                border: isSelected
                    ? null
                    : Border.all(color: AppColors.divider),
              ),
              alignment: Alignment.center,
              child: Text(
                chips[index],
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
