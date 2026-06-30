import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/constants/brand_constants.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/router/route_paths.dart';
import 'package:wedding_planner_india/core/services/backup_file_helper.dart';
import 'package:wedding_planner_india/core/services/backup_service.dart';
import 'package:wedding_planner_india/core/services/local_notification_service.dart';
import 'package:wedding_planner_india/core/utils/formatters.dart';
import 'package:wedding_planner_india/core/widgets/techackode_brand_footer.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  String _locale = 'en';
  bool _reminderEnabled = true;
  DateTime? _lastBackup;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    final lastBackup = await getIt<BackupService>().getLastBackupDate();
    if (mounted) {
      setState(() {
        _darkMode = box.get(AppConstants.darkModeKey, defaultValue: false) as bool;
        _locale = box.get(AppConstants.localeKey, defaultValue: 'en') as String;
        _reminderEnabled =
            box.get(AppConstants.reminderEnabledKey, defaultValue: true) as bool;
        _lastBackup = lastBackup;
      });
    }
  }

  Future<void> _saveDarkMode(bool value) async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    await box.put(AppConstants.darkModeKey, value);
    setState(() => _darkMode = value);
  }

  Future<void> _saveLocale(String value) async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    await box.put(AppConstants.localeKey, value);
    setState(() => _locale = value);
  }

  Future<void> _toggleReminder(bool value) async {
    await getIt<LocalNotificationService>().setReminderEnabled(value);
    setState(() => _reminderEnabled = value);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            value
                ? 'You will get a reminder every 30 days on this device.'
                : '30-day reminders turned off.',
          ),
        ),
      );
    }
  }

  Future<void> _createBackup() async {
    setState(() => _isProcessing = true);
    final result = await getIt<BackupFileHelper>().createAndShareBackup();
    await _loadSettings();
    if (mounted) {
      setState(() => _isProcessing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message)),
      );
    }
  }

  Future<void> _restoreBackup() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Restore Backup?'),
        content: const Text(
          'This will replace all current wedding data with the backup file. '
          'Create a new backup first if you want to keep current data.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Restore'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => _isProcessing = true);
    final result = await getIt<BackupFileHelper>().pickAndRestoreBackup();
    await _loadSettings();
    if (mounted) {
      setState(() => _isProcessing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message)),
      );
      if (result.success) {
        context.go(RoutePaths.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: Stack(
        children: [
          ListView(
            children: [
              const _SectionTitle(title: 'Appearance'),
              SwitchListTile(
                title: Text(l10n.darkMode),
                subtitle: const Text('Toggle dark/light theme'),
                value: _darkMode,
                onChanged: _saveDarkMode,
              ),
              ListTile(
                title: Text(l10n.language),
                subtitle: Text(_localeName(_locale)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showLanguagePicker(context),
              ),
              const Divider(),
              const _SectionTitle(title: 'Backup & Restore'),
              ListTile(
                leading: const Icon(Icons.cloud_upload_outlined),
                title: const Text('Create Backup'),
                subtitle: Text(
                  _lastBackup != null
                      ? 'Last backup: ${AppDateUtils.formatDate(_lastBackup!)}'
                      : 'Export all data to a file (no internet needed)',
                ),
                trailing: const Icon(Icons.file_download_outlined),
                onTap: _isProcessing ? null : _createBackup,
              ),
              ListTile(
                leading: const Icon(Icons.cloud_download_outlined),
                title: const Text('Restore from Backup'),
                subtitle: const Text(
                  'Reinstall app? Upload your backup file to continue planning',
                ),
                trailing: const Icon(Icons.upload_file),
                onTap: _isProcessing ? null : _restoreBackup,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Card(
                  color: Theme.of(context).colorScheme.primaryContainer.withValues(
                        alpha: 0.3,
                      ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How backup works',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '1. Create Backup → save the .json file\n'
                          '2. Delete app or switch phone\n'
                          '3. Install app → Restore from Backup\n'
                          '4. All weddings, guests, budget & tasks return',
                          style: TextStyle(height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              const _SectionTitle(title: 'Reminders'),
              SwitchListTile(
                title: const Text('30-Day Planning Reminder'),
                subtitle: Text(
                  kIsWeb
                      ? 'Local notifications work on Android & iOS only'
                      : 'Get notified every 30 days to review your wedding plan',
                ),
                value: _reminderEnabled && !kIsWeb,
                onChanged: kIsWeb ? null : _toggleReminder,
              ),
              const Divider(),
              ListTile(
                title: Text(l10n.aboutApp),
                subtitle: Text(
                  l10n.aboutAppDescription(
                    BrandConstants.productName,
                    BrandConstants.appVersion,
                    l10n.poweredByTechackode,
                  ),
                ),
              ),
              const Center(child: TechackodeBrandFooter()),
            ],
          ),
          if (_isProcessing)
            const ColoredBox(
              color: Color(0x44000000),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  String _localeName(String code) {
    return switch (code) {
      'ta' => 'தமிழ் (Tamil)',
      'hi' => 'हिंदी (Hindi)',
      'te' => 'తెలుగు (Telugu)',
      'kn' => 'ಕನ್ನಡ (Kannada)',
      'ml' => 'മലയാളം (Malayalam)',
      _ => 'English',
    };
  }

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: AppConstants.supportedLocales.map((locale) {
              return ListTile(
                title: Text(_localeName(locale)),
                trailing: _locale == locale
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  _saveLocale(locale);
                  Navigator.pop(ctx);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
