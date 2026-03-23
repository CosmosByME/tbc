/// History screen — dark mode aware and localized search/filter.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/tbs_colors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/constants/mock_data.dart';
import '../../../core/models/transaction.dart';
import '../widgets/transaction_list_item.dart';
import '../widgets/date_group_header.dart';
import '../widgets/filter_chips_row.dart';

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

  List<Transaction> _filter(List<Transaction> list) {
    if (_searchQuery.isEmpty) return list;
    return list.where((t) =>
        t.merchantName.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  Map<String, List<Transaction>> _group(List<Transaction> list) {
    final map = <String, List<Transaction>>{};
    for (final t in list) {
      map.putIfAbsent(t.date, () => []).add(t);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: TBSColors.background(context),
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.appName, style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w700,
                    color: TBSColors.textPrimary(context))),
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(
                      color: TBSColors.card(context), shape: BoxShape.circle,
                      boxShadow: [BoxShadow(
                          color: TBSColors.shadow(context), blurRadius: 8)]),
                  child: Icon(Icons.notifications_outlined,
                      color: TBSColors.textPrimary(context), size: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: TBSColors.card(context),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: TBSColors.divider(context))),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8)),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: TBSColors.textSecondary(context),
                labelStyle: GoogleFonts.inter(
                    fontSize: 13, fontWeight: FontWeight.w600),
                tabs: const [Tab(text: 'USD'), Tab(text: 'UZS')],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: TabBarView(controller: _tabController, children: [
            _buildUsdTab(l10n),
            _buildUzsTab(l10n),
          ])),
        ]),
      ),
    );
  }

  Widget _buildUsdTab(AppLocalizations l10n) {
    final filtered = _filter(MockData.usdTransactions);
    final grouped = _group(filtered);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        _searchBar(l10n),
        const SizedBox(height: 12),
        FilterChipsRow(
          chips: [l10n.last30Days, l10n.allAccounts, l10n.spending],
          selectedIndex: _timeFilterIndex,
          onSelected: (i) => setState(() => _timeFilterIndex = i),
        ),
        const SizedBox(height: 4),
        Expanded(child: ListView(children: grouped.entries.expand((e) => [
          DateGroupHeader(dateLabel: e.key),
          ...e.value.map((t) => Column(children: [
            TransactionListItem(transaction: t),
            Divider(height: 1, color: TBSColors.divider(context)),
          ])),
        ]).toList())),
      ]),
    );
  }

  Widget _buildUzsTab(AppLocalizations l10n) {
    final grouped = _group(MockData.uzsTransactions);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        _visaChip(),
        const SizedBox(height: 12),
        Row(children: [
          Icon(Icons.calendar_today, size: 16,
              color: TBSColors.textSecondary(context)),
          const SizedBox(width: 8),
          Text('17/02/2026 – 16/03/2026', style: GoogleFonts.inter(
              fontSize: 13, color: TBSColors.textSecondary(context))),
        ]),
        const SizedBox(height: 12),
        FilterChipsRow(
          chips: [l10n.allTypes, l10n.incomes],
          selectedIndex: _accountFilterIndex,
          onSelected: (i) => setState(() => _accountFilterIndex = i),
        ),
        const SizedBox(height: 4),
        Expanded(child: ListView(children: grouped.entries.expand((e) => [
          DateGroupHeader(dateLabel: e.key),
          ...e.value.map((t) => Column(children: [
            TransactionListItem(transaction: t),
            Divider(height: 1, color: TBSColors.divider(context)),
          ])),
        ]).toList())),
      ]),
    );
  }

  Widget _visaChip() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: AppColors.primary, borderRadius: BorderRadius.circular(14)),
    child: Row(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(6)),
        child: Text('VISA', style: GoogleFonts.inter(fontSize: 12,
            fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 1)),
      ),
      const SizedBox(width: 12),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Main balance', style: GoogleFonts.inter(
            fontSize: 11, color: Colors.white70)),
        Text('**** 4482', style: GoogleFonts.inter(
            fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
      ]),
      const Spacer(),
      Text('24,500,000 UZS', style: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
    ]),
  );

  Widget _searchBar(AppLocalizations l10n) => Container(
    height: 44,
    decoration: BoxDecoration(
        color: TBSColors.card(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TBSColors.divider(context))),
    child: Row(children: [
      const SizedBox(width: 12),
      Icon(Icons.search, color: TBSColors.textSecondary(context), size: 20),
      const SizedBox(width: 8),
      Expanded(child: TextField(
        controller: _searchController,
        onChanged: (v) => setState(() => _searchQuery = v),
        decoration: InputDecoration(
          hintText: l10n.searchHint,
          hintStyle: GoogleFonts.inter(
              fontSize: 14, color: TBSColors.textSecondary(context)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero, isDense: true,
        ),
        style: GoogleFonts.inter(
            fontSize: 14, color: TBSColors.textPrimary(context)),
      )),
    ]),
  );
}
