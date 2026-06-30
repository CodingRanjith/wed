import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:wedding_planner_india/data/database/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Weddings,
  Ceremonies,
  BudgetItems,
  Expenses,
  Guests,
  TimelineTasks,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'wedding_planner_db',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
      ),
    );
  }
}

String encodeChecklist(List<Map<String, dynamic>> items) => jsonEncode(items);

List<Map<String, dynamic>> decodeChecklist(String json) {
  if (json.isEmpty || json == '[]') return [];
  final decoded = jsonDecode(json);
  if (decoded is List) {
    return decoded.cast<Map<String, dynamic>>();
  }
  return [];
}
