import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/router/route_paths.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';
import 'package:wedding_planner_india/features/ceremonies/presentation/pages/ceremony_detail_page.dart';
import 'package:wedding_planner_india/features/ceremonies/presentation/pages/ceremonies_page.dart';
import 'package:wedding_planner_india/features/mahals/presentation/pages/mahal_detail_page.dart';
import 'package:wedding_planner_india/features/mahals/presentation/pages/mahal_directions_page.dart';
import 'package:wedding_planner_india/features/mahals/presentation/pages/mahal_map_page.dart';
import 'package:wedding_planner_india/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:wedding_planner_india/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:wedding_planner_india/core/widgets/placeholder_feature_page.dart';
import 'package:wedding_planner_india/features/settings/presentation/pages/settings_page.dart';
import 'package:wedding_planner_india/features/shell/presentation/main_shell.dart';
import 'package:wedding_planner_india/features/splash/presentation/splash_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RoutePaths.welcome,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: RoutePaths.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.home,
                builder: (context, state) =>
                    const MainShellTab(tab: ShellTab.home),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.planner,
                builder: (context, state) =>
                    const MainShellTab(tab: ShellTab.planner),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.budget,
                builder: (context, state) =>
                    const MainShellTab(tab: ShellTab.budget),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.guests,
                builder: (context, state) =>
                    const MainShellTab(tab: ShellTab.guests),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                builder: (context, state) =>
                    const MainShellTab(tab: ShellTab.profile),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.ceremonies,
        builder: (context, state) => const CeremoniesPage(),
      ),
      GoRoute(
        path: RoutePaths.ceremonyDetail,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CeremonyDetailPage(ceremonyId: id);
        },
      ),
      GoRoute(
        path: RoutePaths.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: RoutePaths.vendors,
        builder: (context, state) => const PlaceholderFeaturePage(
          title: 'Vendor Management',
          description:
              'Manage hall, catering, photography, DJ, priest & more with contracts and invoices.',
          icon: Icons.store,
        ),
      ),
      GoRoute(
        path: RoutePaths.jewelry,
        builder: (context, state) => const PlaceholderFeaturePage(
          title: 'Jewelry Planner',
          description:
              'Track gold, temple jewelry, rental, weight, locker & insurance.',
          icon: Icons.diamond,
        ),
      ),
      GoRoute(
        path: RoutePaths.saree,
        builder: (context, state) => const PlaceholderFeaturePage(
          title: 'Saree Planner',
          description:
              'Plan sarees, blouses, jewelry & packing for every function.',
          icon: Icons.checkroom,
        ),
      ),
      GoRoute(
        path: RoutePaths.documents,
        builder: (context, state) => const PlaceholderFeaturePage(
          title: 'Document Vault',
          description:
              'Securely store Aadhar, PAN, bills, contracts & certificates.',
          icon: Icons.folder,
        ),
      ),
      GoRoute(
        path: RoutePaths.calendar,
        builder: (context, state) => const PlaceholderFeaturePage(
          title: 'Wedding Calendar',
          description: 'Month, week & timeline views for all ceremonies.',
          icon: Icons.calendar_month,
        ),
      ),
      GoRoute(
        path: RoutePaths.reports,
        builder: (context, state) => const PlaceholderFeaturePage(
          title: 'Reports',
          description:
              'Budget, guest, vendor & payment reports with PDF export.',
          icon: Icons.assessment,
        ),
      ),
      GoRoute(
        path: RoutePaths.mahals,
        builder: (context, state) => const MahalMapPage(),
      ),
      GoRoute(
        path: RoutePaths.mahalDetail,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return MahalDetailPage(mahalId: id);
        },
        routes: [
          GoRoute(
            path: 'directions',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return MahalDirectionsPage(mahalId: id);
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final isSplash = state.matchedLocation == RoutePaths.splash;
      if (isSplash) return null;

      final isOnboardingRoute = state.matchedLocation == RoutePaths.welcome ||
          state.matchedLocation == RoutePaths.onboarding;

      final complete =
          await getIt<WeddingRepository>().isOnboardingComplete();

      if (!complete && !isOnboardingRoute) {
        return RoutePaths.welcome;
      }
      if (complete &&
          (state.matchedLocation == RoutePaths.welcome ||
              state.matchedLocation == RoutePaths.onboarding)) {
        return RoutePaths.home;
      }
      return null;
    },
  );
}
