import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import '../../../core/state/app_state.dart';
import 'transfer_confirmation_screen.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _cardNumberController = TextEditingController();
  final _amountController = TextEditingController();
  int _selectedCardIndex = 0;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onContinue(Map<String, dynamic> selectedCard) {
    final amountText = _amountController.text.replaceAll(',', '.').trim();
    final amount = double.tryParse(amountText) ?? 0.0;
    final rawBalance = selectedCard['rawBalance'] as double;
    final l10n = AppLocalizations.of(context);

    if (amount <= 0 || amount > rawBalance) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.insufficientFunds,
            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TransferConfirmationScreen(
          recipientCardName: 'John Doe', // Mocked recipient name
          recipientCardNumber: _cardNumberController.text.isEmpty
              ? '0000 0000 0000 0000'
              : _cardNumberController.text,
          amount: amount,
          senderCard: selectedCard,
          senderCardIndex: _selectedCardIndex,
        ),
      ),
    );
  }

  void _showCardSelector(BuildContext context, List<Map<String, dynamic>> cards) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: TBSColors.card(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                AppLocalizations.of(context).paymentCard,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: TBSColors.textPrimary(context),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(cards.length, (index) {
              final card = cards[index];
              final isSelected = _selectedCardIndex == index;
              return InkWell(
                onTap: () {
                  setState(() => _selectedCardIndex = index);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  color: isSelected ? AppColors.accent.withValues(alpha: 0.1) : null,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: card['color'] as Color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.credit_card, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card['label'] as String,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: TBSColors.textPrimary(context),
                              ),
                            ),
                            Text(
                              "${card['cardNumber']} • ${card['balance']}",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: TBSColors.textSecondary(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        const Icon(Icons.check_circle, color: AppColors.accent, size: 24),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cards = AppState.of(context).cards;

    final selectedCard = cards[_selectedCardIndex];

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
          l10n.transferMoney,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(l10n.cardNumber, context),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _cardNumberController,
                hintText: '0000 0000 0000 0000',
                keyboardType: TextInputType.number,
                context: context,
              ),
              const SizedBox(height: 24),
              _buildLabel(l10n.amount, context),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _amountController,
                hintText: '0.00',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                context: context,
                prefixIcon: Icons.attach_money,
              ),
              const SizedBox(height: 24),
              _buildLabel(l10n.paymentCard, context),
              const SizedBox(height: 8),
              _buildPaymentCardSelector(context, selectedCard, cards),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _onContinue(selectedCard),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    l10n.continueText,
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

  Widget _buildLabel(String text, BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: TBSColors.textSecondary(context),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required TextInputType keyboardType,
    required BuildContext context,
    IconData? prefixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: TBSColors.card(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TBSColors.divider(context)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: GoogleFonts.inter(
          color: TBSColors.textPrimary(context),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            color: TBSColors.textSecondary(context).withValues(alpha: 0.5),
          ),
          prefixIcon: prefixIcon != null 
              ? Icon(prefixIcon, color: TBSColors.textSecondary(context))
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildPaymentCardSelector(BuildContext context, Map<String, dynamic> selectedCard, List<Map<String, dynamic>> cards) {
    return GestureDetector(
      onTap: () => _showCardSelector(context, cards),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: TBSColors.card(context),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: TBSColors.divider(context)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedCard['color'] as Color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.credit_card, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedCard['label'] as String,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TBSColors.textPrimary(context),
                    ),
                  ),
                  Text(
                    "${selectedCard['cardNumber']} • ${selectedCard['balance']}",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: TBSColors.textSecondary(context),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: TBSColors.textSecondary(context)),
          ],
        ),
      ),
    );
  }
}
