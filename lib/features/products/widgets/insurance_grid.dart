/// Insurance grid — dark mode aware, localized title.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/tbs_colors.dart';
import '../../../../core/constants/mock_data.dart';
import '../../../../core/models/product.dart';
import '../../../../core/l10n/app_localizations.dart';

class InsuranceGrid extends StatelessWidget {
  const InsuranceGrid({super.key, required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(l10n.insuranceMore, style: GoogleFonts.inter(
          fontSize: 18, fontWeight: FontWeight.w700,
          color: TBSColors.textPrimary(context))),
      const SizedBox(height: 16),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12,
            mainAxisSpacing: 12, childAspectRatio: 1.1),
        itemCount: MockData.insuranceProducts.length,
        itemBuilder: (_, i) =>
            _InsuranceGridItem(product: MockData.insuranceProducts[i]),
      ),
    ]);
  }
}

class _InsuranceGridItem extends StatelessWidget {
  const _InsuranceGridItem({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TBSColors.card(context),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: TBSColors.shadow(context), blurRadius: 8,
            offset: const Offset(0, 2))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
              color: TBSColors.iconBg(context, product.iconColor),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(product.icon, color: product.iconColor, size: 20),
        ),
        const SizedBox(height: 12),
        Text(product.title, style: GoogleFonts.inter(fontSize: 14,
            fontWeight: FontWeight.w600,
            color: TBSColors.textPrimary(context))),
        const SizedBox(height: 4),
        Text(product.subtitle, style: GoogleFonts.inter(fontSize: 11,
            color: TBSColors.textSecondary(context)),
            maxLines: 2, overflow: TextOverflow.ellipsis),
      ]),
    );
  }
}
