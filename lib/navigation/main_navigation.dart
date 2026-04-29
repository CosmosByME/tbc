/// Main navigation shell for the TBS Bank app.
///
/// Uses [IndexedStack] with a [BottomNavigationBar] to preserve
/// scroll state across tabs. Tab labels are localized.
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/l10n/app_localizations.dart';
import '../core/state/app_state.dart';
import '../features/home/screens/home_screen.dart';
import '../features/products/screens/products_screen.dart';
import '../features/history/screens/history_screen.dart';
import '../features/profile/screens/profile_screen.dart';

/// Root widget that manages bottom navigation and tab switching.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  static const List<Widget> _screens = [
    HomeScreen(),
    ProductsScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final notifier = AppState.of(context);

    return ListenableBuilder(
      listenable: notifier,
      builder: (context, _) {
        final currentIndex = notifier.currentTabIndex;
        return Scaffold(
          body: IndexedStack(index: currentIndex, children: _screens),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF161626) : AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => notifier.setTabIndex(index),
              backgroundColor: isDark ? const Color(0xFF161626) : AppColors.surface,
              selectedItemColor:
                  isDark ? AppColors.accent : AppColors.primary,
              unselectedItemColor: AppColors.textSecondary,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_outlined),
                  activeIcon: const Icon(Icons.home),
                  label: l10n.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.payment_outlined),
                  activeIcon: const Icon(Icons.payment),
                  label: l10n.payments,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.history),
                  activeIcon: const Icon(Icons.history),
                  label: l10n.history,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person_outline),
                  activeIcon: const Icon(Icons.person),
                  label: l10n.profile,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
