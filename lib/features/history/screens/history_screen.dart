/// History screen for the TBS Bank app.
///
/// Displays transaction history with two tabs: USD and UZS.
/// Features a search bar that filters by merchant name (case-insensitive),
/// filter chips for time range and account type, and grouped transaction
/// lists with date headers.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/constants/mock_data.dart';
import '../../../core/models/transaction.dart';
import '../widgets/transaction_list_item.dart';
import '../widgets/date_group_header.dart';
import '../widgets/filter_chips_row.dart';

/// Transaction history screen with USD and UZS tabs.
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  int _timeFilterIndex = 0;
  int _accountFilterIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  /// Filters transactions by search query.
  List<Transaction> _filterTransactions(List<Transaction> transactions) {
    if (_searchQuery.isEmpty) return transactions;
    return transactions
        .where((t) =>
            t.merchantName.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  /// Groups transactions by their date field.
  Map<String, List<Transaction>> _groupByDate(List<Transaction> transactions) {
    final map = <String, List<Transaction>>{};
    for (final t in transactions) {
      map.putIfAbsent(t.date, () => []).add(t);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCard,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            // App bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TBS Bank',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Tab bar: USD | UZS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.divider),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: AppColors.textSecondary,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: 'USD'),
                    Tab(text: 'UZS'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Content area (TabBarView)
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildUsdTab(),
                  _buildUzsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// USD transactions tab.
  Widget _buildUsdTab() {
    final filtered = _filterTransactions(MockData.usdTransactions);
    final grouped = _groupByDate(filtered);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Search bar
          _buildSearchBar(),
          const SizedBox(height: 12),
          // Filter chips
          FilterChipsRow(
            chips: const ['Last 30 Days', 'All Accounts', 'Spending'],
            selectedIndex: _timeFilterIndex,
            onSelected: (index) => setState(() => _timeFilterIndex = index),
          ),
          const SizedBox(height: 4),
          // Transaction list
          Expanded(
            child: ListView(
              children: grouped.entries.expand((entry) {
                return [
                  DateGroupHeader(dateLabel: entry.key),
                  ...entry.value.map((t) => Column(
                        children: [
                          TransactionListItem(transaction: t),
                          const Divider(
                            height: 1,
                            color: AppColors.divider,
                          ),
                        ],
                      )),
                ];
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// UZS transactions tab with VISA card chip.
  Widget _buildUzsTab() {
    final grouped = _groupByDate(MockData.uzsTransactions);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // VISA card chip
          _buildVisaCardChip(),
          const SizedBox(height: 12),
          // Date range
          Row(
            children: [
              const Icon(Icons.calendar_today,
                  size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                '17/02/2026 – 16/03/2026',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Filter chips
          FilterChipsRow(
            chips: const ['All Types', 'Incomes'],
            selectedIndex: _accountFilterIndex,
            onSelected: (index) =>
                setState(() => _accountFilterIndex = index),
          ),
          const SizedBox(height: 4),
          // Transaction list
          Expanded(
            child: ListView(
              children: grouped.entries.expand((entry) {
                return [
                  DateGroupHeader(dateLabel: entry.key),
                  ...entry.value.map((t) => Column(
                        children: [
                          TransactionListItem(transaction: t),
                          const Divider(
                            height: 1,
                            color: AppColors.divider,
                          ),
                        ],
                      )),
                ];
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// VISA card chip at the top of UZS tab.
  Widget _buildVisaCardChip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          // VISA logo
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'VISA',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Main balance',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: Colors.white70,
                ),
              ),
              Text(
                '**** 4482',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '24,500,000 UZS',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  /// Search bar widget.
  Widget _buildSearchBar() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.search, color: AppColors.textSecondary, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Search transactions...',
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
              style: GoogleFonts.inter(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
