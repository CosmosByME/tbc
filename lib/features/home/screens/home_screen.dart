/// Home screen — dark mode aware, localized app bar.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../widgets/balance_card.dart';
import '../widgets/quick_actions_row.dart';
import '../widgets/spending_manager_card.dart';
import '../widgets/special_offers_carousel.dart';

import '../widgets/total_balance_widget.dart';
import '../../notifications/screens/notifications_screen.dart';
import '../../../core/state/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBalanceVisible = false;
  int _currentCardIndex = 0;
  final PageController _pageController = PageController();

  List<Map<String, String>> _notifications = [
    {
      'id': '1',
      'type': 'offer',
      'title': 'New Cashback Offer!',
      'description': 'Get 5% cashback on all supermarket purchases this weekend.',
      'time': '2 hours ago',
    },
    {
      'id': '2',
      'type': 'news',
      'title': 'App Update Available',
      'description': 'We have added new features to improve your banking experience.',
      'time': '5 hours ago',
    },
    {
      'id': '3',
      'type': 'offer',
      'title': 'Special Loan Rates',
      'description': 'Pre-approved personal loans up to \$10,000 at lower rates.',
      'time': '1 day ago',
    },
  ];

  void _toggleVisibility() {
    setState(() => _isBalanceVisible = !_isBalanceVisible);
  }

  void _openNotifications() async {
    final remainingNotifications = await Navigator.push<List<Map<String, String>>>(
      context,
      MaterialPageRoute(
        builder: (_) => NotificationsScreen(initialNotifications: _notifications),
      ),
    );

    if (remainingNotifications != null) {
      setState(() {
        _notifications = remainingNotifications;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final appCards = AppState.of(context).cards;
    
    // Copy the cards to localize the label for the first card to keep original behavior
    final displayCards = List<Map<String, dynamic>>.from(appCards);
    if (displayCards.isNotEmpty) {
      displayCards[0] = Map<String, dynamic>.from(displayCards[0]);
      displayCards[0]['label'] = l10n.yourBalance;
    }

    final totalAmount = appCards.fold<double>(0, (sum, card) => sum + (card['rawBalance'] as double));

    return Scaffold(
      backgroundColor: TBSColors.background(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'T',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        l10n.appName,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: TBSColors.textPrimary(context),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: _openNotifications,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: TBSColors.card(context),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: TBSColors.shadow(context),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: TBSColors.textPrimary(context),
                            size: 20,
                          ),
                        ),
                        if (_notifications.isNotEmpty)
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Center(
                                child: Text(
                                  '${_notifications.length}',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TotalBalanceWidget(
                amount: totalAmount,
                isVisible: _isBalanceVisible,
                onToggleVisibility: _toggleVisibility,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 210,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: displayCards.length,
                  onPageChanged: (index) {
                    setState(() => _currentCardIndex = index);
                  },
                  itemBuilder: (context, index) {
                    final card = displayCards[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: BalanceCard(
                        balance: card['balance'] as String,
                        cardNumber: card['cardNumber'] as String,
                        cardType: card['cardType'] as String,
                        label: card['label'] as String,
                        color: card['color'] as Color,
                        isVisible: _isBalanceVisible,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  displayCards.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentCardIndex == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentCardIndex == index
                          ? AppColors.primary
                          : TBSColors.divider(context),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const QuickActionsRow(),
              const SizedBox(height: 24),
              const SpendingManagerCard(),
              const SizedBox(height: 24),
              const SpecialOffersCarousel(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
