import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;
import 'package:wedding_planner_india/core/constants/app_constants.dart';

class LocalNotificationService {
  LocalNotificationService();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const int _reminderNotificationId = 1001;

  bool get isSupported => !kIsWeb;

  Future<void> initialize() async {
    if (!isSupported) return;

    tz_data.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );

    await _syncReminderIfEnabled();
  }

  Future<bool> isReminderEnabled() async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    return box.get(AppConstants.reminderEnabledKey, defaultValue: true) as bool;
  }

  Future<void> setReminderEnabled(bool enabled) async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    await box.put(AppConstants.reminderEnabledKey, enabled);

    if (!isSupported) return;

    if (enabled) {
      await _scheduleNextReminder();
    } else {
      await _plugin.cancel(_reminderNotificationId);
    }
  }

  Future<void> _syncReminderIfEnabled() async {
    if (!isSupported) return;
    if (await isReminderEnabled()) {
      await _scheduleNextReminder();
    }
  }

  Future<void> onAppOpened() async {
    if (!isSupported) return;
    if (!await isReminderEnabled()) return;

    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    final lastAt = box.get(AppConstants.lastReminderAtKey) as String?;
    final lastDate = lastAt != null ? DateTime.tryParse(lastAt) : null;
    final now = DateTime.now();

    if (lastDate == null ||
        now.difference(lastDate).inDays >= AppConstants.reminderIntervalDays) {
      await _scheduleNextReminder();
    }
  }

  Future<void> _scheduleNextReminder() async {
    if (!isSupported) return;

    if (defaultTargetPlatform == TargetPlatform.android) {
      final androidPlugin =
          _plugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidPlugin?.requestNotificationsPermission();
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosPlugin = _plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();
      await iosPlugin?.requestPermissions(alert: true, badge: true, sound: true);
    }

    await _plugin.cancel(_reminderNotificationId);

    final scheduled = tz.TZDateTime.now(tz.local).add(
      const Duration(days: AppConstants.reminderIntervalDays),
    );

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'wedding_reminders',
        'Wedding Planning Reminders',
        channelDescription:
            'Reminds you every 30 days to review your wedding planning',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _plugin.zonedSchedule(
      _reminderNotificationId,
      'Wedding Diary Reminder',
      'It has been 30 days! Open the app to review tasks, budget, guests & ceremonies.',
      scheduled,
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );

    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    await box.put(
      AppConstants.lastReminderAtKey,
      DateTime.now().toIso8601String(),
    );
  }
}
