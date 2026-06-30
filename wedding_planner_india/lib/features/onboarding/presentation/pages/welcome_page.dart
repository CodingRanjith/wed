import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/router/route_paths.dart';
import 'package:wedding_planner_india/core/widgets/techackode_brand_footer.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const _logoAsset = 'assets/images/logo/logo.png';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                _logoAsset,
                width: width * 0.65,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 32),
              Text(
                l10n.welcome,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.welcomeSubtitle,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () => context.push(RoutePaths.onboarding),
                  child: Text(l10n.getStarted),
                ),
              ),
              const SizedBox(height: 16),
              const TechackodeBrandFooter(compact: true),
            ],
          ),
        ),
      ),
    );
  }
}
