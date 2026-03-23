/// Filter chips row — dark mode aware selected/unselected colors.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/tbs_colors.dart';

class FilterChipsRow extends StatelessWidget {
  const FilterChipsRow({
    super.key, required this.chips,
    required this.selectedIndex, required this.onSelected,
  });

  final List<String> chips;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.accent : TBSColors.cardAlt(context),
                borderRadius: BorderRadius.circular(20),
                border: isSelected ? null
                    : Border.all(color: TBSColors.divider(context)),
              ),
              alignment: Alignment.center,
              child: Text(chips[index], style: GoogleFonts.inter(
                  fontSize: 12, fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white
                      : TBSColors.textSecondary(context))),
            ),
          );
        },
      ),
    );
  }
}
