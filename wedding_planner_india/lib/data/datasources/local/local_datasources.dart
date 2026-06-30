import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/utils/guest_side_utils.dart';
import 'package:wedding_planner_india/core/constants/ceremony_templates.dart';
import 'package:wedding_planner_india/data/database/app_database.dart';
import 'package:wedding_planner_india/domain/entities/budget_entity.dart';
import 'package:wedding_planner_india/domain/entities/ceremony_entity.dart';
import 'package:wedding_planner_india/domain/entities/guest_entity.dart';
import 'package:wedding_planner_india/domain/entities/timeline_task_entity.dart';
import 'package:wedding_planner_india/domain/entities/wedding_entity.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';

const _uuid = Uuid();

class WeddingLocalDataSourceImpl implements WeddingLocalDataSource {
  WeddingLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<WeddingEntity?> getActiveWedding() async {
    final rows = await _db.select(_db.weddings).get();
    if (rows.isEmpty) return null;
    return _mapWedding(rows.first);
  }

  @override
  Future<void> saveWedding(WeddingEntity wedding) async {
    await _db.into(_db.weddings).insertOnConflictUpdate(
          WeddingsCompanion(
            id: Value(wedding.id),
            brideName: Value(wedding.brideName),
            groomName: Value(wedding.groomName),
            weddingDate: Value(wedding.weddingDate),
            location: Value(wedding.location),
            weddingType: Value(wedding.weddingType.name),
            budget: Value(wedding.budget),
            guestCount: Value(wedding.guestCount),
            religion: Value(wedding.religion),
            tradition: Value(wedding.tradition),
            currency: Value(wedding.currency),
          ),
        );
  }

  @override
  Future<bool> isOnboardingComplete() async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    return box.get(AppConstants.onboardingCompleteKey, defaultValue: false)
        as bool;
  }

  @override
  Future<void> setOnboardingComplete(bool value) async {
    final box = await Hive.openBox(AppConstants.hiveSettingsBox);
    await box.put(AppConstants.onboardingCompleteKey, value);
  }

  WeddingEntity _mapWedding(Wedding row) {
    return WeddingEntity(
      id: row.id,
      brideName: row.brideName,
      groomName: row.groomName,
      weddingDate: row.weddingDate,
      location: row.location,
      weddingType: WeddingType.values.firstWhere(
        (e) => e.name == row.weddingType,
        orElse: () => WeddingType.tamilHindu,
      ),
      budget: row.budget,
      guestCount: row.guestCount,
      religion: row.religion,
      tradition: row.tradition,
      currency: row.currency,
      createdAt: row.createdAt,
    );
  }
}

class CeremonyLocalDataSourceImpl implements CeremonyLocalDataSource {
  CeremonyLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<CeremonyEntity>> getCeremonies(String weddingId) async {
    final rows = await (_db.select(_db.ceremonies)
          ..where((t) => t.weddingId.equals(weddingId))
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .get();
    return rows.map(_mapCeremony).toList();
  }

  @override
  Future<void> saveCeremony(CeremonyEntity ceremony) async {
    await _db.into(_db.ceremonies).insertOnConflictUpdate(
          CeremoniesCompanion(
            id: Value(ceremony.id),
            weddingId: Value(ceremony.weddingId),
            name: Value(ceremony.name),
            side: Value(ceremony.side.name),
            sortOrder: Value(ceremony.sortOrder),
            date: Value(ceremony.date),
            time: Value(ceremony.time),
            venue: Value(ceremony.venue),
            dress: Value(ceremony.dress),
            jewelry: Value(ceremony.jewelry),
            budget: Value(ceremony.budget),
            notes: Value(ceremony.notes),
            isSkipped: Value(ceremony.isSkipped),
            isCustom: Value(ceremony.isCustom),
            checklistJson: Value(_encodeChecklist(ceremony.checklist)),
          ),
        );
  }

  @override
  Future<void> deleteCeremony(String id) async {
    await (_db.delete(_db.ceremonies)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> reorderCeremonies(List<CeremonyEntity> ceremonies) async {
    for (var i = 0; i < ceremonies.length; i++) {
      await saveCeremony(ceremonies[i].copyWith(sortOrder: i));
    }
  }

  @override
  Future<void> seedCeremonies(String weddingId, WeddingType type) async {
    final existing = await getCeremonies(weddingId);
    if (existing.isNotEmpty) return;

    final templates = CeremonyTemplates.forWeddingType(type);
    for (var i = 0; i < templates.length; i++) {
      final template = templates[i];
      await saveCeremony(
        CeremonyEntity(
          id: _uuid.v4(),
          weddingId: weddingId,
          name: template.name,
          side: template.side,
          sortOrder: i,
          isCustom: false,
          checklist: template.defaultChecklist
              .map(
                (title) => ChecklistItemEntity(
                  id: _uuid.v4(),
                  title: title,
                ),
              )
              .toList(),
        ),
      );
    }
  }

  CeremonyEntity _mapCeremony(Ceremony row) {
    return CeremonyEntity(
      id: row.id,
      weddingId: row.weddingId,
      name: row.name,
      side: CeremonySide.values.firstWhere(
        (e) => e.name == row.side,
        orElse: () => CeremonySide.both,
      ),
      sortOrder: row.sortOrder,
      date: row.date,
      time: row.time,
      venue: row.venue,
      dress: row.dress,
      jewelry: row.jewelry,
      budget: row.budget,
      notes: row.notes,
      isSkipped: row.isSkipped,
      isCustom: row.isCustom,
      checklist: _decodeChecklist(row.checklistJson),
    );
  }

  String _encodeChecklist(List<ChecklistItemEntity> items) {
    return jsonEncode(
      items
          .map(
            (e) => {
              'id': e.id,
              'title': e.title,
              'isCompleted': e.isCompleted,
            },
          )
          .toList(),
    );
  }

  List<ChecklistItemEntity> _decodeChecklist(String json) {
    final list = decodeChecklist(json);
    return list
        .map(
          (e) => ChecklistItemEntity(
            id: e['id'] as String,
            title: e['title'] as String,
            isCompleted: e['isCompleted'] as bool? ?? false,
          ),
        )
        .toList();
  }
}

class BudgetLocalDataSourceImpl implements BudgetLocalDataSource {
  BudgetLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<BudgetItemEntity>> getBudgetItems(String weddingId) async {
    final rows = await (_db.select(_db.budgetItems)
          ..where((t) => t.weddingId.equals(weddingId)))
        .get();
    return rows.map(_mapBudgetItem).toList();
  }

  @override
  Future<void> saveBudgetItem(BudgetItemEntity item) async {
    await _db.into(_db.budgetItems).insertOnConflictUpdate(
          BudgetItemsCompanion(
            id: Value(item.id),
            weddingId: Value(item.weddingId),
            category: Value(item.category.name),
            estimated: Value(item.estimated),
            actual: Value(item.actual),
            paid: Value(item.paid),
            vendor: Value(item.vendor),
            notes: Value(item.notes),
          ),
        );
  }

  @override
  Future<List<ExpenseEntity>> getExpenses(String weddingId) async {
    final rows = await (_db.select(_db.expenses)
          ..where((t) => t.weddingId.equals(weddingId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .get();
    return rows.map(_mapExpense).toList();
  }

  @override
  Future<void> saveExpense(ExpenseEntity expense) async {
    await _db.into(_db.expenses).insertOnConflictUpdate(
          ExpensesCompanion(
            id: Value(expense.id),
            weddingId: Value(expense.weddingId),
            title: Value(expense.title),
            amount: Value(expense.amount),
            category: Value(expense.category.name),
            date: Value(expense.date),
            vendor: Value(expense.vendor),
            gst: Value(expense.gst),
            paymentMethod: Value(expense.paymentMethod),
            dueDate: Value(expense.dueDate),
            notes: Value(expense.notes),
          ),
        );
  }

  @override
  Future<void> seedBudgetCategories(String weddingId) async {
    final existing = await getBudgetItems(weddingId);
    if (existing.isNotEmpty) return;

    for (final category in BudgetCategory.values) {
      await saveBudgetItem(
        BudgetItemEntity(
          id: _uuid.v4(),
          weddingId: weddingId,
          category: category,
          estimated: 0,
        ),
      );
    }
  }

  BudgetItemEntity _mapBudgetItem(BudgetItem row) {
    return BudgetItemEntity(
      id: row.id,
      weddingId: row.weddingId,
      category: BudgetCategory.values.firstWhere(
        (e) => e.name == row.category,
        orElse: () => BudgetCategory.miscellaneous,
      ),
      estimated: row.estimated,
      actual: row.actual,
      paid: row.paid,
      vendor: row.vendor,
      notes: row.notes,
    );
  }

  ExpenseEntity _mapExpense(Expense row) {
    return ExpenseEntity(
      id: row.id,
      weddingId: row.weddingId,
      title: row.title,
      amount: row.amount,
      category: BudgetCategory.values.firstWhere(
        (e) => e.name == row.category,
        orElse: () => BudgetCategory.miscellaneous,
      ),
      date: row.date,
      vendor: row.vendor,
      gst: row.gst,
      paymentMethod: row.paymentMethod,
      dueDate: row.dueDate,
      notes: row.notes,
    );
  }
}

class GuestLocalDataSourceImpl implements GuestLocalDataSource {
  GuestLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<GuestEntity>> getGuests(String weddingId) async {
    final rows = await (_db.select(_db.guests)
          ..where((t) => t.weddingId.equals(weddingId))
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
    return rows.map(_mapGuest).toList();
  }

  @override
  Future<void> saveGuest(GuestEntity guest) async {
    await _db.into(_db.guests).insertOnConflictUpdate(
          GuestsCompanion(
            id: Value(guest.id),
            weddingId: Value(guest.weddingId),
            name: Value(guest.name),
            side: Value(guest.side.name),
            phone: Value(guest.phone),
            email: Value(guest.email),
            rsvpStatus: Value(guest.rsvpStatus.name),
            foodPreference: Value(guest.foodPreference.name),
            invitationSent: Value(guest.invitationSent),
            roomAllocation: Value(guest.roomAllocation),
            tableNumber: Value(guest.tableNumber),
            giftReceived: Value(guest.giftReceived),
            giftValue: Value(guest.giftValue),
            thankYouSent: Value(guest.thankYouSent),
            notes: Value(guest.notes),
          ),
        );
  }

  @override
  Future<void> deleteGuest(String id) async {
    await (_db.delete(_db.guests)..where((t) => t.id.equals(id))).go();
  }

  GuestEntity _mapGuest(Guest row) {
    return GuestEntity(
      id: row.id,
      weddingId: row.weddingId,
      name: row.name,
      side: GuestSideX.parse(row.side),
      phone: row.phone,
      email: row.email,
      rsvpStatus: RsvpStatus.values.firstWhere(
        (e) => e.name == row.rsvpStatus,
        orElse: () => RsvpStatus.pending,
      ),
      foodPreference: FoodPreference.values.firstWhere(
        (e) => e.name == row.foodPreference,
        orElse: () => FoodPreference.veg,
      ),
      invitationSent: row.invitationSent,
      roomAllocation: row.roomAllocation,
      tableNumber: row.tableNumber,
      giftReceived: row.giftReceived,
      giftValue: row.giftValue,
      thankYouSent: row.thankYouSent,
      notes: row.notes,
    );
  }
}

class TimelineLocalDataSourceImpl implements TimelineLocalDataSource {
  TimelineLocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<TimelineTaskEntity>> getTasks(String weddingId) async {
    final rows = await (_db.select(_db.timelineTasks)
          ..where((t) => t.weddingId.equals(weddingId)))
        .get();
    return rows.map(_mapTask).toList();
  }

  @override
  Future<void> saveTask(TimelineTaskEntity task) async {
    await _db.into(_db.timelineTasks).insertOnConflictUpdate(
          TimelineTasksCompanion(
            id: Value(task.id),
            weddingId: Value(task.weddingId),
            stage: Value(task.stage.name),
            title: Value(task.title),
            isCompleted: Value(task.isCompleted),
            dueDate: Value(task.dueDate),
          ),
        );
  }

  @override
  Future<void> toggleTask(String id, bool completed) async {
    await (_db.update(_db.timelineTasks)..where((t) => t.id.equals(id))).write(
      TimelineTasksCompanion(isCompleted: Value(completed)),
    );
  }

  @override
  Future<void> seedTimeline(String weddingId) async {
    final existing = await getTasks(weddingId);
    if (existing.isNotEmpty) return;

    for (final entry in CeremonyTemplates.defaultTimelineTasks.entries) {
      for (final title in entry.value) {
        await saveTask(
          TimelineTaskEntity(
            id: _uuid.v4(),
            weddingId: weddingId,
            stage: entry.key,
            title: title,
          ),
        );
      }
    }
  }

  TimelineTaskEntity _mapTask(TimelineTask row) {
    return TimelineTaskEntity(
      id: row.id,
      weddingId: row.weddingId,
      stage: TimelineStage.values.firstWhere(
        (e) => e.name == row.stage,
        orElse: () => TimelineStage.days90,
      ),
      title: row.title,
      isCompleted: row.isCompleted,
      dueDate: row.dueDate,
    );
  }
}
