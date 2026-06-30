import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/constants/brand_constants.dart';
import 'package:wedding_planner_india/data/database/app_database.dart';

class BackupResult {
  const BackupResult({
    required this.success,
    this.message = '',
    this.filePath,
  });

  final bool success;
  final String message;
  final String? filePath;
}

class BackupService {
  BackupService(this._db);

  final AppDatabase _db;

  Future<Map<String, dynamic>> exportToMap() async {
    final settingsBox = await Hive.openBox(AppConstants.hiveSettingsBox);
    final settings = Map<String, dynamic>.from(settingsBox.toMap());

    final weddings = await _db.select(_db.weddings).get();
    final ceremonies = await _db.select(_db.ceremonies).get();
    final budgetItems = await _db.select(_db.budgetItems).get();
    final expenses = await _db.select(_db.expenses).get();
    final guests = await _db.select(_db.guests).get();
    final timelineTasks = await _db.select(_db.timelineTasks).get();

    return {
      'formatVersion': AppConstants.backupFormatVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'app': BrandConstants.productName,
      'publisher': BrandConstants.companyName,
      'settings': settings,
      'weddings': weddings.map(_weddingToMap).toList(),
      'ceremonies': ceremonies.map(_ceremonyToMap).toList(),
      'budgetItems': budgetItems.map(_budgetItemToMap).toList(),
      'expenses': expenses.map(_expenseToMap).toList(),
      'guests': guests.map(_guestToMap).toList(),
      'timelineTasks': timelineTasks.map(_timelineTaskToMap).toList(),
    };
  }

  Future<String> exportToJson() async {
    return const JsonEncoder.withIndent('  ').convert(await exportToMap());
  }

  Future<BackupResult> restoreFromJson(String jsonString) async {
    try {
      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      final version = data['formatVersion'] as int? ?? 0;
      if (version != AppConstants.backupFormatVersion) {
        return const BackupResult(
          success: false,
          message: 'Unsupported backup file version.',
        );
      }

      await _db.transaction(() async {
        await _db.delete(_db.timelineTasks).go();
        await _db.delete(_db.guests).go();
        await _db.delete(_db.expenses).go();
        await _db.delete(_db.budgetItems).go();
        await _db.delete(_db.ceremonies).go();
        await _db.delete(_db.weddings).go();

        for (final row in data['weddings'] as List<dynamic>) {
          await _db.into(_db.weddings).insert(_weddingFromMap(row));
        }
        for (final row in data['ceremonies'] as List<dynamic>) {
          await _db.into(_db.ceremonies).insert(_ceremonyFromMap(row));
        }
        for (final row in data['budgetItems'] as List<dynamic>) {
          await _db.into(_db.budgetItems).insert(_budgetItemFromMap(row));
        }
        for (final row in data['expenses'] as List<dynamic>) {
          await _db.into(_db.expenses).insert(_expenseFromMap(row));
        }
        for (final row in data['guests'] as List<dynamic>) {
          await _db.into(_db.guests).insert(_guestFromMap(row));
        }
        for (final row in data['timelineTasks'] as List<dynamic>) {
          await _db.into(_db.timelineTasks).insert(_timelineTaskFromMap(row));
        }
      });

      final settings = data['settings'] as Map<String, dynamic>? ?? {};
      final settingsBox = await Hive.openBox(AppConstants.hiveSettingsBox);
      await settingsBox.clear();
      for (final entry in settings.entries) {
        await settingsBox.put(entry.key, entry.value);
      }

      await settingsBox.put(
        AppConstants.lastBackupAtKey,
        DateTime.now().toIso8601String(),
      );

      return const BackupResult(
        success: true,
        message: 'Backup restored successfully. Your wedding data is back!',
      );
    } catch (e) {
      debugPrint('Restore failed: $e');
      return BackupResult(
        success: false,
        message: 'Failed to restore backup. Please check the file.',
      );
    }
  }

  Future<void> markBackupCreated() async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    await box.put(
      AppConstants.lastBackupAtKey,
      DateTime.now().toIso8601String(),
    );
  }

  Future<DateTime?> getLastBackupDate() async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    final value = box.get(AppConstants.lastBackupAtKey) as String?;
    if (value == null) return null;
    return DateTime.tryParse(value);
  }

  Map<String, dynamic> _weddingToMap(Wedding row) => {
        'id': row.id,
        'brideName': row.brideName,
        'groomName': row.groomName,
        'weddingDate': row.weddingDate.toIso8601String(),
        'location': row.location,
        'weddingType': row.weddingType,
        'budget': row.budget,
        'guestCount': row.guestCount,
        'religion': row.religion,
        'tradition': row.tradition,
        'currency': row.currency,
        'createdAt': row.createdAt.toIso8601String(),
      };

  WeddingsCompanion _weddingFromMap(Map<String, dynamic> m) {
    return WeddingsCompanion.insert(
      id: m['id'] as String,
      brideName: m['brideName'] as String,
      groomName: m['groomName'] as String,
      weddingDate: DateTime.parse(m['weddingDate'] as String),
      location: m['location'] as String,
      weddingType: m['weddingType'] as String,
      budget: (m['budget'] as num).toDouble(),
      guestCount: m['guestCount'] as int,
      religion: m['religion'] as String,
      tradition: m['tradition'] as String,
      currency: m['currency'] as String,
      createdAt: Value(DateTime.parse(m['createdAt'] as String)),
    );
  }

  Map<String, dynamic> _ceremonyToMap(Ceremony row) => {
        'id': row.id,
        'weddingId': row.weddingId,
        'name': row.name,
        'side': row.side,
        'sortOrder': row.sortOrder,
        'date': row.date?.toIso8601String(),
        'time': row.time,
        'venue': row.venue,
        'dress': row.dress,
        'jewelry': row.jewelry,
        'budget': row.budget,
        'notes': row.notes,
        'isSkipped': row.isSkipped,
        'isCustom': row.isCustom,
        'checklistJson': row.checklistJson,
      };

  CeremoniesCompanion _ceremonyFromMap(Map<String, dynamic> m) {
    return CeremoniesCompanion.insert(
      id: m['id'] as String,
      weddingId: m['weddingId'] as String,
      name: m['name'] as String,
      side: m['side'] as String,
      sortOrder: m['sortOrder'] as int,
      date: Value(
        m['date'] != null ? DateTime.parse(m['date'] as String) : null,
      ),
      time: Value(m['time'] as String?),
      venue: Value(m['venue'] as String? ?? ''),
      dress: Value(m['dress'] as String? ?? ''),
      jewelry: Value(m['jewelry'] as String? ?? ''),
      budget: Value((m['budget'] as num?)?.toDouble() ?? 0),
      notes: Value(m['notes'] as String? ?? ''),
      isSkipped: Value(m['isSkipped'] as bool? ?? false),
      isCustom: Value(m['isCustom'] as bool? ?? false),
      checklistJson: Value(m['checklistJson'] as String? ?? '[]'),
    );
  }

  Map<String, dynamic> _budgetItemToMap(BudgetItem row) => {
        'id': row.id,
        'weddingId': row.weddingId,
        'category': row.category,
        'estimated': row.estimated,
        'actual': row.actual,
        'paid': row.paid,
        'vendor': row.vendor,
        'notes': row.notes,
      };

  BudgetItemsCompanion _budgetItemFromMap(Map<String, dynamic> m) {
    return BudgetItemsCompanion.insert(
      id: m['id'] as String,
      weddingId: m['weddingId'] as String,
      category: m['category'] as String,
      estimated: (m['estimated'] as num).toDouble(),
      actual: Value((m['actual'] as num?)?.toDouble() ?? 0),
      paid: Value((m['paid'] as num?)?.toDouble() ?? 0),
      vendor: Value(m['vendor'] as String? ?? ''),
      notes: Value(m['notes'] as String? ?? ''),
    );
  }

  Map<String, dynamic> _expenseToMap(Expense row) => {
        'id': row.id,
        'weddingId': row.weddingId,
        'title': row.title,
        'amount': row.amount,
        'category': row.category,
        'date': row.date.toIso8601String(),
        'vendor': row.vendor,
        'gst': row.gst,
        'paymentMethod': row.paymentMethod,
        'dueDate': row.dueDate?.toIso8601String(),
        'notes': row.notes,
      };

  ExpensesCompanion _expenseFromMap(Map<String, dynamic> m) {
    return ExpensesCompanion.insert(
      id: m['id'] as String,
      weddingId: m['weddingId'] as String,
      title: m['title'] as String,
      amount: (m['amount'] as num).toDouble(),
      category: m['category'] as String,
      date: DateTime.parse(m['date'] as String),
      vendor: Value(m['vendor'] as String? ?? ''),
      gst: Value((m['gst'] as num?)?.toDouble() ?? 0),
      paymentMethod: Value(m['paymentMethod'] as String? ?? 'Cash'),
      dueDate: Value(
        m['dueDate'] != null ? DateTime.parse(m['dueDate'] as String) : null,
      ),
      notes: Value(m['notes'] as String? ?? ''),
    );
  }

  Map<String, dynamic> _guestToMap(Guest row) => {
        'id': row.id,
        'weddingId': row.weddingId,
        'name': row.name,
        'side': row.side,
        'phone': row.phone,
        'email': row.email,
        'rsvpStatus': row.rsvpStatus,
        'foodPreference': row.foodPreference,
        'invitationSent': row.invitationSent,
        'roomAllocation': row.roomAllocation,
        'tableNumber': row.tableNumber,
        'giftReceived': row.giftReceived,
        'giftValue': row.giftValue,
        'thankYouSent': row.thankYouSent,
        'notes': row.notes,
      };

  GuestsCompanion _guestFromMap(Map<String, dynamic> m) {
    return GuestsCompanion.insert(
      id: m['id'] as String,
      weddingId: m['weddingId'] as String,
      name: m['name'] as String,
      side: m['side'] as String,
      phone: Value(m['phone'] as String? ?? ''),
      email: Value(m['email'] as String? ?? ''),
      rsvpStatus: Value(m['rsvpStatus'] as String? ?? 'pending'),
      foodPreference: Value(m['foodPreference'] as String? ?? 'veg'),
      invitationSent: Value(m['invitationSent'] as bool? ?? false),
      roomAllocation: Value(m['roomAllocation'] as String? ?? ''),
      tableNumber: Value(m['tableNumber'] as String? ?? ''),
      giftReceived: Value(m['giftReceived'] as String? ?? ''),
      giftValue: Value((m['giftValue'] as num?)?.toDouble() ?? 0),
      thankYouSent: Value(m['thankYouSent'] as bool? ?? false),
      notes: Value(m['notes'] as String? ?? ''),
    );
  }

  Map<String, dynamic> _timelineTaskToMap(TimelineTask row) => {
        'id': row.id,
        'weddingId': row.weddingId,
        'stage': row.stage,
        'title': row.title,
        'isCompleted': row.isCompleted,
        'dueDate': row.dueDate?.toIso8601String(),
      };

  TimelineTasksCompanion _timelineTaskFromMap(Map<String, dynamic> m) {
    return TimelineTasksCompanion.insert(
      id: m['id'] as String,
      weddingId: m['weddingId'] as String,
      stage: m['stage'] as String,
      title: m['title'] as String,
      isCompleted: Value(m['isCompleted'] as bool? ?? false),
      dueDate: Value(
        m['dueDate'] != null ? DateTime.parse(m['dueDate'] as String) : null,
      ),
    );
  }
}
