/// Contains all hardcoded mock data used throughout the TBS Bank prototype.
///
/// Includes transaction lists for both USD and UZS history screens,
/// product listings, spending chart data, and special offer details.
/// Screens receive this data as constructor parameters.
import 'package:flutter/material.dart';

import '../../core/models/transaction.dart';
import '../../core/models/product.dart';
import '../theme/app_colors.dart';

/// Static mock data for the entire app.
class MockData {
  MockData._();

  // ──────────────────────────────────────────────
  // USD Transactions (History Screen)
  // ──────────────────────────────────────────────

  static const List<Transaction> usdTransactions = [
    // Today · Oct 24
    Transaction(
      id: 'usd_1',
      merchantName: 'Whole Foods Market',
      category: 'Grocery',
      amount: -84.20,
      currency: 'USD',
      date: 'TODAY · Oct 24',
      time: '15:30',
      icon: Icons.shopping_bag_outlined,
      iconColor: AppColors.accentBlue,
    ),
    Transaction(
      id: 'usd_2',
      merchantName: 'Salary Deposit',
      category: 'Income',
      amount: 4250.00,
      currency: 'USD',
      date: 'TODAY · Oct 24',
      time: '09:00',
      icon: Icons.account_balance_wallet_outlined,
      iconColor: AppColors.accent,
      isIncome: true,
    ),
    // Yesterday · Oct 23
    Transaction(
      id: 'usd_3',
      merchantName: 'Blue Bottle Coffee',
      category: 'Dining',
      amount: -6.50,
      currency: 'USD',
      date: 'YESTERDAY · Oct 23',
      time: '08:45',
      icon: Icons.local_cafe_outlined,
      iconColor: AppColors.accentBlue,
    ),
    Transaction(
      id: 'usd_4',
      merchantName: 'Uber Trip',
      category: 'Transport',
      amount: -24.80,
      currency: 'USD',
      date: 'YESTERDAY · Oct 23',
      time: '17:20',
      icon: Icons.directions_car_outlined,
      iconColor: AppColors.accentBlue,
    ),
    Transaction(
      id: 'usd_5',
      merchantName: 'Transfer from Savings',
      category: 'Internal',
      amount: 500.00,
      currency: 'USD',
      date: 'YESTERDAY · Oct 23',
      time: '12:00',
      icon: Icons.swap_horiz,
      iconColor: AppColors.accent,
      isIncome: true,
    ),
  ];

  // ──────────────────────────────────────────────
  // UZS Transactions (History Screen - UZS tab)
  // ──────────────────────────────────────────────

  static const List<Transaction> uzsTransactions = [
    // 15 March
    Transaction(
      id: 'uzs_1',
      merchantName: 'Card Payment',
      category: 'Korzinka.uz',
      amount: -450000,
      currency: 'UZS',
      date: '15 March',
      time: '14:32',
      icon: Icons.credit_card,
      iconColor: AppColors.accentBlue,
    ),
    Transaction(
      id: 'uzs_2',
      merchantName: 'Transfer by card number',
      category: 'To Akmal I.',
      amount: -1200000,
      currency: 'UZS',
      date: '15 March',
      time: '11:05',
      icon: Icons.send_outlined,
      iconColor: AppColors.accentBlue,
    ),
    Transaction(
      id: 'uzs_3',
      merchantName: 'Incoming Transfer',
      category: 'From Salary Account',
      amount: 8500000,
      currency: 'UZS',
      date: '15 March',
      time: '09:15',
      icon: Icons.account_balance_wallet_outlined,
      iconColor: AppColors.accent,
      isIncome: true,
    ),
    // 13 March
    Transaction(
      id: 'uzs_4',
      merchantName: 'Subscription',
      category: 'Netflix',
      amount: -145000,
      currency: 'UZS',
      date: '13 March',
      time: '23:59',
      icon: Icons.subscriptions_outlined,
      iconColor: AppColors.accentBlue,
    ),
    Transaction(
      id: 'uzs_5',
      merchantName: 'Card Payment',
      category: 'Lukoil Station #12',
      amount: -320000,
      currency: 'UZS',
      date: '13 March',
      time: '18:20',
      icon: Icons.local_gas_station_outlined,
      iconColor: AppColors.accentBlue,
    ),
  ];

  // ──────────────────────────────────────────────
  // Spending Chart Data (Home)
  // ──────────────────────────────────────────────

  /// Bar chart values for the spending manager (6 months).
  static const List<double> spendingChartValues = [
    620, 980, 1240, 850, 1100, 760,
  ];

  /// Labels for each bar in the spending chart.
  static const List<String> spendingChartLabels = [
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  // ──────────────────────────────────────────────
  // Products
  // ──────────────────────────────────────────────

  static const List<Product> insuranceProducts = [
    Product(
      id: 'ins_1',
      title: 'Home Insurance',
      subtitle: 'Protect your property',
      icon: Icons.home_outlined,
      iconColor: AppColors.accentBlue,
    ),
    Product(
      id: 'ins_2',
      title: 'Auto Insurance',
      subtitle: 'Full coverage',
      icon: Icons.directions_car_outlined,
      iconColor: AppColors.accentBlue,
    ),
    Product(
      id: 'ins_3',
      title: 'Life Insurance',
      subtitle: 'Secure your future',
      icon: Icons.favorite_outline,
      iconColor: AppColors.accentBlue,
    ),
    Product(
      id: 'ins_4',
      title: 'Business Accounts',
      subtitle: 'Scale your business',
      icon: Icons.business_outlined,
      iconColor: AppColors.accentBlue,
    ),
  ];
}
