import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';

import '../../../core/state/app_state.dart';

class TransferVerificationScreen extends StatefulWidget {
  final double amount;
  final int senderCardIndex;

  const TransferVerificationScreen({
    super.key,
    required this.amount,
    required this.senderCardIndex,
  });

  @override
  State<TransferVerificationScreen> createState() => _TransferVerificationScreenState();
}

class _TransferVerificationScreenState extends State<TransferVerificationScreen> {
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final l10n = AppLocalizations.of(context);
    
    // Perform the actual transfer logic
    AppState.of(context).performTransfer(widget.senderCardIndex, widget.amount);

    // Simulate verification success and pop back to home (2 screens back)
    Navigator.of(context).popUntil((route) => route.isFirst);
    
    // Show success snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.transferSuccess,
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: AppColors.accent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
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
          l10n.verifyTransfer,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message_outlined,
                size: 64,
                color: AppColors.accentBlue,
              ),
              const SizedBox(height: 24),
              Text(
                l10n.enterSmsCode,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: TBSColors.textPrimary(context),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'We sent a 4-digit code to your phone',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: TBSColors.textSecondary(context),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              _buildCodeInput(context),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onConfirm,
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
        ),
      ),
    );
  }

  Widget _buildCodeInput(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: TBSColors.card(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TBSColors.divider(context)),
      ),
      child: TextField(
        controller: _codeController,
        keyboardType: TextInputType.number,
        maxLength: 4,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: TBSColors.textPrimary(context),
          fontSize: 32,
          letterSpacing: 16,
          fontWeight: FontWeight.w700,
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
