/// Digital assets / crypto section for the Products screen.
///
/// Shows a dark card with BTC/ETH/SOL chips and an "Explore Markets" button.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

/// Digital Assets section with crypto ticker chips.
class CryptoSection extends StatelessWidget {
  const CryptoSection({super.key, this.onExplore});

  /// Callback when "Explore Markets" is tapped.
  final VoidCallback? onExplore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Digital Assets',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Buy, sell, and hold crypto directly within your TBS Bank app. Integrated with the latest market data.',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Crypto chips
          Row(
            children: [
              _CryptoChip(label: 'BTC', color: const Color(0xFFF7931A)),
              const SizedBox(width: 8),
              _CryptoChip(label: 'ETH', color: const Color(0xFF627EEA)),
              const SizedBox(width: 8),
              _CryptoChip(label: 'SOL', color: const Color(0xFF00FFA3)),
            ],
          ),
          const SizedBox(height: 20),
          // Explore Markets button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onExplore,
              icon: const Icon(Icons.arrow_forward, size: 18),
              label: Text(
                'Explore Markets',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A small colored chip for a cryptocurrency ticker.
class _CryptoChip extends StatelessWidget {
  const _CryptoChip({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
