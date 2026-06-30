import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';
import 'package:wedding_planner_india/features/budget/presentation/pages/budget_page.dart';
import 'package:wedding_planner_india/features/guests/presentation/pages/guests_page.dart';
import 'package:wedding_planner_india/features/home/presentation/pages/home_page.dart';
import 'package:wedding_planner_india/features/planner/presentation/pages/planner_page.dart';
import 'package:wedding_planner_india/features/profile/presentation/pages/profile_page.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

enum ShellTab { home, planner, budget, guests, profile }

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.timeline_outlined),
            selectedIcon: const Icon(Icons.timeline),
            label: l10n.planner,
          ),
          NavigationDestination(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: const Icon(Icons.account_balance_wallet),
            label: l10n.budget,
          ),
          NavigationDestination(
            icon: const Icon(Icons.people_outline),
            selectedIcon: const Icon(Icons.people),
            label: l10n.guests,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }
}

class MainShellTab extends StatefulWidget {
  const MainShellTab({super.key, required this.tab});

  final ShellTab tab;

  @override
  State<MainShellTab> createState() => _MainShellTabState();
}

class _MainShellTabState extends State<MainShellTab> {
  String? _weddingId;

  @override
  void initState() {
    super.initState();
    _loadWeddingId();
  }

  Future<void> _loadWeddingId() async {
    final wedding = await getIt<WeddingRepository>().getActiveWedding();
    if (mounted) {
      setState(() => _weddingId = wedding?.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_weddingId == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return switch (widget.tab) {
      ShellTab.home => HomePage(weddingId: _weddingId!),
      ShellTab.planner => PlannerPage(weddingId: _weddingId!),
      ShellTab.budget => BudgetPage(weddingId: _weddingId!),
      ShellTab.guests => GuestsPage(weddingId: _weddingId!),
      ShellTab.profile => ProfilePage(weddingId: _weddingId!),
    };
  }
}
