import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import 'transfer_verification_screen.dart';

class TransferConfirmationScreen extends StatelessWidget {
  final String recipientCardName;
  final String recipientCardNumber;
  final double amount;
  final Map<String, dynamic> senderCard;
  final int senderCardIndex;

  const TransferConfirmationScreen({
    super.key,
    required this.recipientCardName,
    required this.recipientCardNumber,
    required this.amount,
    required this.senderCard,
    required this.senderCardIndex,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();
    final dateStr = "${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    return Scaffold(
      backgroundColor: TBSColors.background(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: TBSColors.textPrimary(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.transferDetails,
          style: GoogleFonts.inter(
            color: TBSColors.textPrimary(context),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: TBSColors.card(context),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: TBSColors.divider(context)),
                ),
                child: Column(
                  children: [
                    _buildRow(l10n.amount, "\$${amount.toStringAsFixed(2)}", context, isHighlight: true),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(),
                    ),
                    _buildRow(l10n.recipient, recipientCardName, context),
                    const SizedBox(height: 12),
                    _buildRow(" ", recipientCardNumber, context),
                    const SizedBox(height: 16),
                    _buildRow(l10n.sender, senderCard['label'] as String, context),
                    const SizedBox(height: 12),
                    _buildRow(" ", senderCard['cardNumber'] as String, context),
                    const SizedBox(height: 16),
                    _buildRow(l10n.date, dateStr, context),
                    const SizedBox(height: 16),
                    _buildRow(l10n.fee, "\$0.00", context),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(),
                    ),
                    _buildRow(l10n.totalAmount, "\$${amount.toStringAsFixed(2)}", context, isHighlight: true),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: TBSColors.divider(context)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        l10n.cancel,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: TBSColors.textPrimary(context),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TransferVerificationScreen(
                              amount: amount,
                              senderCardIndex: senderCardIndex,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        l10n.confirm,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, BuildContext context, {bool isHighlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: isHighlight ? 16 : 14,
            fontWeight: isHighlight ? FontWeight.w600 : FontWeight.w400,
            color: TBSColors.textSecondary(context),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: isHighlight ? 18 : 14,
            fontWeight: isHighlight ? FontWeight.w700 : FontWeight.w500,
            color: TBSColors.textPrimary(context),
          ),
        ),
      ],
    );
  }
}
