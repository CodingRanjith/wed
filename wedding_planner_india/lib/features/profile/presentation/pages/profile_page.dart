import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/router/route_paths.dart';
import 'package:wedding_planner_india/core/utils/formatters.dart';
import 'package:wedding_planner_india/core/widgets/techackode_brand_footer.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.weddingId});

  final String weddingId;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return FutureBuilder(
      future: getIt<WeddingRepository>().getActiveWedding(),
      builder: (context, snapshot) {
        final wedding = snapshot.data;
        if (wedding == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(title: Text(l10n.profile)),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.15),
                        child: Icon(
                          Icons.favorite,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${wedding.brideName} & ${wedding.groomName}',
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppDateUtils.formatDate(wedding.weddingDate),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        wedding.location,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ProfileTile(
                icon: Icons.map,
                title: 'Nearby Marriage Mahals',
                subtitle: 'Map, reviews, directions & phone — 1/5/8 km',
                onTap: () => context.push(RoutePaths.mahals),
              ),
              _ProfileTile(
                icon: Icons.temple_hindu,
                title: l10n.ceremonies,
                subtitle: wedding.weddingType.label,
                onTap: () => context.push(RoutePaths.ceremonies),
              ),
              _ProfileTile(
                icon: Icons.store,
                title: 'Vendors',
                subtitle: 'Manage hall, catering, photography',
                onTap: () => context.push(RoutePaths.vendors),
              ),
              _ProfileTile(
                icon: Icons.diamond,
                title: 'Jewelry Planner',
                subtitle: 'Gold, temple jewelry, rental tracking',
                onTap: () => context.push(RoutePaths.jewelry),
              ),
              _ProfileTile(
                icon: Icons.checkroom,
                title: 'Saree Planner',
                subtitle: 'Outfits for every function',
                onTap: () => context.push(RoutePaths.saree),
              ),
              _ProfileTile(
                icon: Icons.folder,
                title: 'Documents',
                subtitle: 'Aadhar, bills, contracts',
                onTap: () => context.push(RoutePaths.documents),
              ),
              _ProfileTile(
                icon: Icons.calendar_month,
                title: 'Calendar',
                subtitle: 'Month, week & timeline views',
                onTap: () => context.push(RoutePaths.calendar),
              ),
              _ProfileTile(
                icon: Icons.assessment,
                title: 'Reports',
                subtitle: 'Budget, guest & vendor reports',
                onTap: () => context.push(RoutePaths.reports),
              ),
              _ProfileTile(
                icon: Icons.settings,
                title: l10n.settings,
                subtitle: 'Backup, restore, language & reminders',
                onTap: () => context.push(RoutePaths.settings),
              ),
              const SizedBox(height: 16),
              const TechackodeBrandFooter(compact: true),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
