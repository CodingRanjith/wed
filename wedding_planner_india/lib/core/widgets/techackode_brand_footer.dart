import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_planner_india/core/constants/brand_constants.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class TechackodeBrandFooter extends StatelessWidget {
  const TechackodeBrandFooter({
    super.key,
    this.light = false,
    this.compact = false,
  });

  /// Use on dark backgrounds (e.g. splash screen).
  final bool light;

  final bool compact;

  Future<void> _openWebsite() async {
    final uri = Uri.parse(BrandConstants.website);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textColor = light
        ? Colors.white.withValues(alpha: 0.7)
        : theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return InkWell(
      onTap: _openWebsite,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: compact ? 4 : 8,
          horizontal: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.poweredByTechackode,
              style: theme.textTheme.bodySmall?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            if (!compact) ...[
              const SizedBox(height: 2),
              Text(
                BrandConstants.website.replaceFirst('https://', ''),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: textColor.withValues(alpha: 0.8),
                  decoration: TextDecoration.underline,
                  decorationColor: textColor.withValues(alpha: 0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
