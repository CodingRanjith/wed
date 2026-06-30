import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/domain/entities/budget_entity.dart';
import 'package:wedding_planner_india/domain/entities/ceremony_entity.dart';
import 'package:wedding_planner_india/domain/entities/guest_entity.dart';
import 'package:wedding_planner_india/domain/entities/timeline_task_entity.dart';
import 'package:wedding_planner_india/domain/entities/wedding_entity.dart';

class WeddingRepository {
  WeddingRepository(this._local);

  final WeddingLocalDataSource _local;

  Future<WeddingEntity?> getActiveWedding() => _local.getActiveWedding();

  Future<void> saveWedding(WeddingEntity wedding) => _local.saveWedding(wedding);

  Future<bool> isOnboardingComplete() => _local.isOnboardingComplete();

  Future<void> setOnboardingComplete(bool value) =>
      _local.setOnboardingComplete(value);
}

class CeremonyRepository {
  CeremonyRepository(this._local);

  final CeremonyLocalDataSource _local;

  Future<List<CeremonyEntity>> getCeremonies(String weddingId) =>
      _local.getCeremonies(weddingId);

  Future<void> saveCeremony(CeremonyEntity ceremony) =>
      _local.saveCeremony(ceremony);

  Future<void> deleteCeremony(String id) => _local.deleteCeremony(id);

  Future<void> reorderCeremonies(List<CeremonyEntity> ceremonies) =>
      _local.reorderCeremonies(ceremonies);

  Future<void> seedCeremonies(String weddingId, WeddingType type) =>
      _local.seedCeremonies(weddingId, type);
}

class BudgetRepository {
  BudgetRepository(this._local);

  final BudgetLocalDataSource _local;

  Future<List<BudgetItemEntity>> getBudgetItems(String weddingId) =>
      _local.getBudgetItems(weddingId);

  Future<void> saveBudgetItem(BudgetItemEntity item) =>
      _local.saveBudgetItem(item);

  Future<List<ExpenseEntity>> getExpenses(String weddingId) =>
      _local.getExpenses(weddingId);

  Future<void> saveExpense(ExpenseEntity expense) =>
      _local.saveExpense(expense);

  Future<void> seedBudgetCategories(String weddingId) =>
      _local.seedBudgetCategories(weddingId);
}

class GuestRepository {
  GuestRepository(this._local);

  final GuestLocalDataSource _local;

  Future<List<GuestEntity>> getGuests(String weddingId) =>
      _local.getGuests(weddingId);

  Future<void> saveGuest(GuestEntity guest) => _local.saveGuest(guest);

  Future<void> deleteGuest(String id) => _local.deleteGuest(id);
}

class TimelineRepository {
  TimelineRepository(this._local);

  final TimelineLocalDataSource _local;

  Future<List<TimelineTaskEntity>> getTasks(String weddingId) =>
      _local.getTasks(weddingId);

  Future<void> saveTask(TimelineTaskEntity task) => _local.saveTask(task);

  Future<void> toggleTask(String id, bool completed) =>
      _local.toggleTask(id, completed);

  Future<void> seedTimeline(String weddingId) => _local.seedTimeline(weddingId);
}

// Abstract data source interfaces (implemented in local datasource file)
abstract class WeddingLocalDataSource {
  Future<WeddingEntity?> getActiveWedding();
  Future<void> saveWedding(WeddingEntity wedding);
  Future<bool> isOnboardingComplete();
  Future<void> setOnboardingComplete(bool value);
}

abstract class CeremonyLocalDataSource {
  Future<List<CeremonyEntity>> getCeremonies(String weddingId);
  Future<void> saveCeremony(CeremonyEntity ceremony);
  Future<void> deleteCeremony(String id);
  Future<void> reorderCeremonies(List<CeremonyEntity> ceremonies);
  Future<void> seedCeremonies(String weddingId, WeddingType type);
}

abstract class BudgetLocalDataSource {
  Future<List<BudgetItemEntity>> getBudgetItems(String weddingId);
  Future<void> saveBudgetItem(BudgetItemEntity item);
  Future<List<ExpenseEntity>> getExpenses(String weddingId);
  Future<void> saveExpense(ExpenseEntity expense);
  Future<void> seedBudgetCategories(String weddingId);
}

abstract class GuestLocalDataSource {
  Future<List<GuestEntity>> getGuests(String weddingId);
  Future<void> saveGuest(GuestEntity guest);
  Future<void> deleteGuest(String id);
}

abstract class TimelineLocalDataSource {
  Future<List<TimelineTaskEntity>> getTasks(String weddingId);
  Future<void> saveTask(TimelineTaskEntity task);
  Future<void> toggleTask(String id, bool completed);
  Future<void> seedTimeline(String weddingId);
}
