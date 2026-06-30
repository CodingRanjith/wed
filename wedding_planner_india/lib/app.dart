import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/router/app_router.dart';
import 'package:wedding_planner_india/core/services/local_notification_service.dart';
import 'package:wedding_planner_india/core/theme/app_theme.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class WeddingApp extends StatefulWidget {
  const WeddingApp({super.key});

  @override
  State<WeddingApp> createState() => _WeddingAppState();
}

class _WeddingAppState extends State<WeddingApp> with WidgetsBindingObserver {
  bool _darkMode = false;
  Locale _locale = const Locale('en');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadSettings();
    getIt<LocalNotificationService>().onAppOpened();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getIt<LocalNotificationService>().onAppOpened();
      _loadSettings();
    }
  }

  Future<void> _loadSettings() async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    if (mounted) {
      setState(() {
        _darkMode =
            box.get(AppConstants.darkModeKey, defaultValue: false) as bool;
        final code =
            box.get(AppConstants.localeKey, defaultValue: 'en') as String;
        _locale = Locale(code);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wedding Diary',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ta'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: AppRouter.router,
    );
  }
}
