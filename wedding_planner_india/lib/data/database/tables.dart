import 'package:drift/drift.dart';

class Weddings extends Table {
  TextColumn get id => text()();
  TextColumn get brideName => text()();
  TextColumn get groomName => text()();
  DateTimeColumn get weddingDate => dateTime()();
  TextColumn get location => text()();
  TextColumn get weddingType => text()();
  RealColumn get budget => real()();
  IntColumn get guestCount => integer()();
  TextColumn get religion => text()();
  TextColumn get tradition => text()();
  TextColumn get currency => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Ceremonies extends Table {
  TextColumn get id => text()();
  TextColumn get weddingId => text()();
  TextColumn get name => text()();
  TextColumn get side => text()();
  IntColumn get sortOrder => integer()();
  DateTimeColumn get date => dateTime().nullable()();
  TextColumn get time => text().nullable()();
  TextColumn get venue => text().withDefault(const Constant(''))();
  TextColumn get dress => text().withDefault(const Constant(''))();
  TextColumn get jewelry => text().withDefault(const Constant(''))();
  RealColumn get budget => real().withDefault(const Constant(0))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  BoolColumn get isSkipped => boolean().withDefault(const Constant(false))();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  TextColumn get checklistJson => text().withDefault(const Constant('[]'))();

  @override
  Set<Column> get primaryKey => {id};
}

class BudgetItems extends Table {
  TextColumn get id => text()();
  TextColumn get weddingId => text()();
  TextColumn get category => text()();
  RealColumn get estimated => real()();
  RealColumn get actual => real().withDefault(const Constant(0))();
  RealColumn get paid => real().withDefault(const Constant(0))();
  TextColumn get vendor => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

class Expenses extends Table {
  TextColumn get id => text()();
  TextColumn get weddingId => text()();
  TextColumn get title => text()();
  RealColumn get amount => real()();
  TextColumn get category => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get vendor => text().withDefault(const Constant(''))();
  RealColumn get gst => real().withDefault(const Constant(0))();
  TextColumn get paymentMethod => text().withDefault(const Constant('Cash'))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get notes => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

class Guests extends Table {
  TextColumn get id => text()();
  TextColumn get weddingId => text()();
  TextColumn get name => text()();
  TextColumn get side => text()();
  TextColumn get phone => text().withDefault(const Constant(''))();
  TextColumn get email => text().withDefault(const Constant(''))();
  TextColumn get rsvpStatus => text().withDefault(const Constant('pending'))();
  TextColumn get foodPreference => text().withDefault(const Constant('veg'))();
  BoolColumn get invitationSent => boolean().withDefault(const Constant(false))();
  TextColumn get roomAllocation => text().withDefault(const Constant(''))();
  TextColumn get tableNumber => text().withDefault(const Constant(''))();
  TextColumn get giftReceived => text().withDefault(const Constant(''))();
  RealColumn get giftValue => real().withDefault(const Constant(0))();
  BoolColumn get thankYouSent => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

class TimelineTasks extends Table {
  TextColumn get id => text()();
  TextColumn get weddingId => text()();
  TextColumn get stage => text()();
  TextColumn get title => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get dueDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
