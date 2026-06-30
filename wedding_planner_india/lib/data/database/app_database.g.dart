// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WeddingsTable extends Weddings with TableInfo<$WeddingsTable, Wedding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeddingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brideNameMeta = const VerificationMeta(
    'brideName',
  );
  @override
  late final GeneratedColumn<String> brideName = GeneratedColumn<String>(
    'bride_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groomNameMeta = const VerificationMeta(
    'groomName',
  );
  @override
  late final GeneratedColumn<String> groomName = GeneratedColumn<String>(
    'groom_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weddingDateMeta = const VerificationMeta(
    'weddingDate',
  );
  @override
  late final GeneratedColumn<DateTime> weddingDate = GeneratedColumn<DateTime>(
    'wedding_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weddingTypeMeta = const VerificationMeta(
    'weddingType',
  );
  @override
  late final GeneratedColumn<String> weddingType = GeneratedColumn<String>(
    'wedding_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<double> budget = GeneratedColumn<double>(
    'budget',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guestCountMeta = const VerificationMeta(
    'guestCount',
  );
  @override
  late final GeneratedColumn<int> guestCount = GeneratedColumn<int>(
    'guest_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _religionMeta = const VerificationMeta(
    'religion',
  );
  @override
  late final GeneratedColumn<String> religion = GeneratedColumn<String>(
    'religion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _traditionMeta = const VerificationMeta(
    'tradition',
  );
  @override
  late final GeneratedColumn<String> tradition = GeneratedColumn<String>(
    'tradition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    brideName,
    groomName,
    weddingDate,
    location,
    weddingType,
    budget,
    guestCount,
    religion,
    tradition,
    currency,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weddings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Wedding> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('bride_name')) {
      context.handle(
        _brideNameMeta,
        brideName.isAcceptableOrUnknown(data['bride_name']!, _brideNameMeta),
      );
    } else if (isInserting) {
      context.missing(_brideNameMeta);
    }
    if (data.containsKey('groom_name')) {
      context.handle(
        _groomNameMeta,
        groomName.isAcceptableOrUnknown(data['groom_name']!, _groomNameMeta),
      );
    } else if (isInserting) {
      context.missing(_groomNameMeta);
    }
    if (data.containsKey('wedding_date')) {
      context.handle(
        _weddingDateMeta,
        weddingDate.isAcceptableOrUnknown(
          data['wedding_date']!,
          _weddingDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weddingDateMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('wedding_type')) {
      context.handle(
        _weddingTypeMeta,
        weddingType.isAcceptableOrUnknown(
          data['wedding_type']!,
          _weddingTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weddingTypeMeta);
    }
    if (data.containsKey('budget')) {
      context.handle(
        _budgetMeta,
        budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta),
      );
    } else if (isInserting) {
      context.missing(_budgetMeta);
    }
    if (data.containsKey('guest_count')) {
      context.handle(
        _guestCountMeta,
        guestCount.isAcceptableOrUnknown(data['guest_count']!, _guestCountMeta),
      );
    } else if (isInserting) {
      context.missing(_guestCountMeta);
    }
    if (data.containsKey('religion')) {
      context.handle(
        _religionMeta,
        religion.isAcceptableOrUnknown(data['religion']!, _religionMeta),
      );
    } else if (isInserting) {
      context.missing(_religionMeta);
    }
    if (data.containsKey('tradition')) {
      context.handle(
        _traditionMeta,
        tradition.isAcceptableOrUnknown(data['tradition']!, _traditionMeta),
      );
    } else if (isInserting) {
      context.missing(_traditionMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Wedding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Wedding(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      brideName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bride_name'],
      )!,
      groomName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}groom_name'],
      )!,
      weddingDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}wedding_date'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      weddingType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wedding_type'],
      )!,
      budget: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}budget'],
      )!,
      guestCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guest_count'],
      )!,
      religion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}religion'],
      )!,
      tradition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tradition'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WeddingsTable createAlias(String alias) {
    return $WeddingsTable(attachedDatabase, alias);
  }
}

class Wedding extends DataClass implements Insertable<Wedding> {
  final String id;
  final String brideName;
  final String groomName;
  final DateTime weddingDate;
  final String location;
  final String weddingType;
  final double budget;
  final int guestCount;
  final String religion;
  final String tradition;
  final String currency;
  final DateTime createdAt;
  const Wedding({
    required this.id,
    required this.brideName,
    required this.groomName,
    required this.weddingDate,
    required this.location,
    required this.weddingType,
    required this.budget,
    required this.guestCount,
    required this.religion,
    required this.tradition,
    required this.currency,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['bride_name'] = Variable<String>(brideName);
    map['groom_name'] = Variable<String>(groomName);
    map['wedding_date'] = Variable<DateTime>(weddingDate);
    map['location'] = Variable<String>(location);
    map['wedding_type'] = Variable<String>(weddingType);
    map['budget'] = Variable<double>(budget);
    map['guest_count'] = Variable<int>(guestCount);
    map['religion'] = Variable<String>(religion);
    map['tradition'] = Variable<String>(tradition);
    map['currency'] = Variable<String>(currency);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WeddingsCompanion toCompanion(bool nullToAbsent) {
    return WeddingsCompanion(
      id: Value(id),
      brideName: Value(brideName),
      groomName: Value(groomName),
      weddingDate: Value(weddingDate),
      location: Value(location),
      weddingType: Value(weddingType),
      budget: Value(budget),
      guestCount: Value(guestCount),
      religion: Value(religion),
      tradition: Value(tradition),
      currency: Value(currency),
      createdAt: Value(createdAt),
    );
  }

  factory Wedding.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Wedding(
      id: serializer.fromJson<String>(json['id']),
      brideName: serializer.fromJson<String>(json['brideName']),
      groomName: serializer.fromJson<String>(json['groomName']),
      weddingDate: serializer.fromJson<DateTime>(json['weddingDate']),
      location: serializer.fromJson<String>(json['location']),
      weddingType: serializer.fromJson<String>(json['weddingType']),
      budget: serializer.fromJson<double>(json['budget']),
      guestCount: serializer.fromJson<int>(json['guestCount']),
      religion: serializer.fromJson<String>(json['religion']),
      tradition: serializer.fromJson<String>(json['tradition']),
      currency: serializer.fromJson<String>(json['currency']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'brideName': serializer.toJson<String>(brideName),
      'groomName': serializer.toJson<String>(groomName),
      'weddingDate': serializer.toJson<DateTime>(weddingDate),
      'location': serializer.toJson<String>(location),
      'weddingType': serializer.toJson<String>(weddingType),
      'budget': serializer.toJson<double>(budget),
      'guestCount': serializer.toJson<int>(guestCount),
      'religion': serializer.toJson<String>(religion),
      'tradition': serializer.toJson<String>(tradition),
      'currency': serializer.toJson<String>(currency),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Wedding copyWith({
    String? id,
    String? brideName,
    String? groomName,
    DateTime? weddingDate,
    String? location,
    String? weddingType,
    double? budget,
    int? guestCount,
    String? religion,
    String? tradition,
    String? currency,
    DateTime? createdAt,
  }) => Wedding(
    id: id ?? this.id,
    brideName: brideName ?? this.brideName,
    groomName: groomName ?? this.groomName,
    weddingDate: weddingDate ?? this.weddingDate,
    location: location ?? this.location,
    weddingType: weddingType ?? this.weddingType,
    budget: budget ?? this.budget,
    guestCount: guestCount ?? this.guestCount,
    religion: religion ?? this.religion,
    tradition: tradition ?? this.tradition,
    currency: currency ?? this.currency,
    createdAt: createdAt ?? this.createdAt,
  );
  Wedding copyWithCompanion(WeddingsCompanion data) {
    return Wedding(
      id: data.id.present ? data.id.value : this.id,
      brideName: data.brideName.present ? data.brideName.value : this.brideName,
      groomName: data.groomName.present ? data.groomName.value : this.groomName,
      weddingDate: data.weddingDate.present
          ? data.weddingDate.value
          : this.weddingDate,
      location: data.location.present ? data.location.value : this.location,
      weddingType: data.weddingType.present
          ? data.weddingType.value
          : this.weddingType,
      budget: data.budget.present ? data.budget.value : this.budget,
      guestCount: data.guestCount.present
          ? data.guestCount.value
          : this.guestCount,
      religion: data.religion.present ? data.religion.value : this.religion,
      tradition: data.tradition.present ? data.tradition.value : this.tradition,
      currency: data.currency.present ? data.currency.value : this.currency,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Wedding(')
          ..write('id: $id, ')
          ..write('brideName: $brideName, ')
          ..write('groomName: $groomName, ')
          ..write('weddingDate: $weddingDate, ')
          ..write('location: $location, ')
          ..write('weddingType: $weddingType, ')
          ..write('budget: $budget, ')
          ..write('guestCount: $guestCount, ')
          ..write('religion: $religion, ')
          ..write('tradition: $tradition, ')
          ..write('currency: $currency, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    brideName,
    groomName,
    weddingDate,
    location,
    weddingType,
    budget,
    guestCount,
    religion,
    tradition,
    currency,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Wedding &&
          other.id == this.id &&
          other.brideName == this.brideName &&
          other.groomName == this.groomName &&
          other.weddingDate == this.weddingDate &&
          other.location == this.location &&
          other.weddingType == this.weddingType &&
          other.budget == this.budget &&
          other.guestCount == this.guestCount &&
          other.religion == this.religion &&
          other.tradition == this.tradition &&
          other.currency == this.currency &&
          other.createdAt == this.createdAt);
}

class WeddingsCompanion extends UpdateCompanion<Wedding> {
  final Value<String> id;
  final Value<String> brideName;
  final Value<String> groomName;
  final Value<DateTime> weddingDate;
  final Value<String> location;
  final Value<String> weddingType;
  final Value<double> budget;
  final Value<int> guestCount;
  final Value<String> religion;
  final Value<String> tradition;
  final Value<String> currency;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const WeddingsCompanion({
    this.id = const Value.absent(),
    this.brideName = const Value.absent(),
    this.groomName = const Value.absent(),
    this.weddingDate = const Value.absent(),
    this.location = const Value.absent(),
    this.weddingType = const Value.absent(),
    this.budget = const Value.absent(),
    this.guestCount = const Value.absent(),
    this.religion = const Value.absent(),
    this.tradition = const Value.absent(),
    this.currency = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeddingsCompanion.insert({
    required String id,
    required String brideName,
    required String groomName,
    required DateTime weddingDate,
    required String location,
    required String weddingType,
    required double budget,
    required int guestCount,
    required String religion,
    required String tradition,
    required String currency,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       brideName = Value(brideName),
       groomName = Value(groomName),
       weddingDate = Value(weddingDate),
       location = Value(location),
       weddingType = Value(weddingType),
       budget = Value(budget),
       guestCount = Value(guestCount),
       religion = Value(religion),
       tradition = Value(tradition),
       currency = Value(currency);
  static Insertable<Wedding> custom({
    Expression<String>? id,
    Expression<String>? brideName,
    Expression<String>? groomName,
    Expression<DateTime>? weddingDate,
    Expression<String>? location,
    Expression<String>? weddingType,
    Expression<double>? budget,
    Expression<int>? guestCount,
    Expression<String>? religion,
    Expression<String>? tradition,
    Expression<String>? currency,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brideName != null) 'bride_name': brideName,
      if (groomName != null) 'groom_name': groomName,
      if (weddingDate != null) 'wedding_date': weddingDate,
      if (location != null) 'location': location,
      if (weddingType != null) 'wedding_type': weddingType,
      if (budget != null) 'budget': budget,
      if (guestCount != null) 'guest_count': guestCount,
      if (religion != null) 'religion': religion,
      if (tradition != null) 'tradition': tradition,
      if (currency != null) 'currency': currency,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeddingsCompanion copyWith({
    Value<String>? id,
    Value<String>? brideName,
    Value<String>? groomName,
    Value<DateTime>? weddingDate,
    Value<String>? location,
    Value<String>? weddingType,
    Value<double>? budget,
    Value<int>? guestCount,
    Value<String>? religion,
    Value<String>? tradition,
    Value<String>? currency,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return WeddingsCompanion(
      id: id ?? this.id,
      brideName: brideName ?? this.brideName,
      groomName: groomName ?? this.groomName,
      weddingDate: weddingDate ?? this.weddingDate,
      location: location ?? this.location,
      weddingType: weddingType ?? this.weddingType,
      budget: budget ?? this.budget,
      guestCount: guestCount ?? this.guestCount,
      religion: religion ?? this.religion,
      tradition: tradition ?? this.tradition,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (brideName.present) {
      map['bride_name'] = Variable<String>(brideName.value);
    }
    if (groomName.present) {
      map['groom_name'] = Variable<String>(groomName.value);
    }
    if (weddingDate.present) {
      map['wedding_date'] = Variable<DateTime>(weddingDate.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (weddingType.present) {
      map['wedding_type'] = Variable<String>(weddingType.value);
    }
    if (budget.present) {
      map['budget'] = Variable<double>(budget.value);
    }
    if (guestCount.present) {
      map['guest_count'] = Variable<int>(guestCount.value);
    }
    if (religion.present) {
      map['religion'] = Variable<String>(religion.value);
    }
    if (tradition.present) {
      map['tradition'] = Variable<String>(tradition.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeddingsCompanion(')
          ..write('id: $id, ')
          ..write('brideName: $brideName, ')
          ..write('groomName: $groomName, ')
          ..write('weddingDate: $weddingDate, ')
          ..write('location: $location, ')
          ..write('weddingType: $weddingType, ')
          ..write('budget: $budget, ')
          ..write('guestCount: $guestCount, ')
          ..write('religion: $religion, ')
          ..write('tradition: $tradition, ')
          ..write('currency: $currency, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CeremoniesTable extends Ceremonies
    with TableInfo<$CeremoniesTable, Ceremony> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CeremoniesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<String> weddingId = GeneratedColumn<String>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sideMeta = const VerificationMeta('side');
  @override
  late final GeneratedColumn<String> side = GeneratedColumn<String>(
    'side',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
    'time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _venueMeta = const VerificationMeta('venue');
  @override
  late final GeneratedColumn<String> venue = GeneratedColumn<String>(
    'venue',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _dressMeta = const VerificationMeta('dress');
  @override
  late final GeneratedColumn<String> dress = GeneratedColumn<String>(
    'dress',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _jewelryMeta = const VerificationMeta(
    'jewelry',
  );
  @override
  late final GeneratedColumn<String> jewelry = GeneratedColumn<String>(
    'jewelry',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<double> budget = GeneratedColumn<double>(
    'budget',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isSkippedMeta = const VerificationMeta(
    'isSkipped',
  );
  @override
  late final GeneratedColumn<bool> isSkipped = GeneratedColumn<bool>(
    'is_skipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_skipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _checklistJsonMeta = const VerificationMeta(
    'checklistJson',
  );
  @override
  late final GeneratedColumn<String> checklistJson = GeneratedColumn<String>(
    'checklist_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    name,
    side,
    sortOrder,
    date,
    time,
    venue,
    dress,
    jewelry,
    budget,
    notes,
    isSkipped,
    isCustom,
    checklistJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ceremonies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ceremony> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('side')) {
      context.handle(
        _sideMeta,
        side.isAcceptableOrUnknown(data['side']!, _sideMeta),
      );
    } else if (isInserting) {
      context.missing(_sideMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    }
    if (data.containsKey('venue')) {
      context.handle(
        _venueMeta,
        venue.isAcceptableOrUnknown(data['venue']!, _venueMeta),
      );
    }
    if (data.containsKey('dress')) {
      context.handle(
        _dressMeta,
        dress.isAcceptableOrUnknown(data['dress']!, _dressMeta),
      );
    }
    if (data.containsKey('jewelry')) {
      context.handle(
        _jewelryMeta,
        jewelry.isAcceptableOrUnknown(data['jewelry']!, _jewelryMeta),
      );
    }
    if (data.containsKey('budget')) {
      context.handle(
        _budgetMeta,
        budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_skipped')) {
      context.handle(
        _isSkippedMeta,
        isSkipped.isAcceptableOrUnknown(data['is_skipped']!, _isSkippedMeta),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    if (data.containsKey('checklist_json')) {
      context.handle(
        _checklistJsonMeta,
        checklistJson.isAcceptableOrUnknown(
          data['checklist_json']!,
          _checklistJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ceremony map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ceremony(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wedding_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      side: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      ),
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time'],
      ),
      venue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}venue'],
      )!,
      dress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dress'],
      )!,
      jewelry: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jewelry'],
      )!,
      budget: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}budget'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      isSkipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_skipped'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
      checklistJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checklist_json'],
      )!,
    );
  }

  @override
  $CeremoniesTable createAlias(String alias) {
    return $CeremoniesTable(attachedDatabase, alias);
  }
}

class Ceremony extends DataClass implements Insertable<Ceremony> {
  final String id;
  final String weddingId;
  final String name;
  final String side;
  final int sortOrder;
  final DateTime? date;
  final String? time;
  final String venue;
  final String dress;
  final String jewelry;
  final double budget;
  final String notes;
  final bool isSkipped;
  final bool isCustom;
  final String checklistJson;
  const Ceremony({
    required this.id,
    required this.weddingId,
    required this.name,
    required this.side,
    required this.sortOrder,
    this.date,
    this.time,
    required this.venue,
    required this.dress,
    required this.jewelry,
    required this.budget,
    required this.notes,
    required this.isSkipped,
    required this.isCustom,
    required this.checklistJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['wedding_id'] = Variable<String>(weddingId);
    map['name'] = Variable<String>(name);
    map['side'] = Variable<String>(side);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<String>(time);
    }
    map['venue'] = Variable<String>(venue);
    map['dress'] = Variable<String>(dress);
    map['jewelry'] = Variable<String>(jewelry);
    map['budget'] = Variable<double>(budget);
    map['notes'] = Variable<String>(notes);
    map['is_skipped'] = Variable<bool>(isSkipped);
    map['is_custom'] = Variable<bool>(isCustom);
    map['checklist_json'] = Variable<String>(checklistJson);
    return map;
  }

  CeremoniesCompanion toCompanion(bool nullToAbsent) {
    return CeremoniesCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      name: Value(name),
      side: Value(side),
      sortOrder: Value(sortOrder),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      venue: Value(venue),
      dress: Value(dress),
      jewelry: Value(jewelry),
      budget: Value(budget),
      notes: Value(notes),
      isSkipped: Value(isSkipped),
      isCustom: Value(isCustom),
      checklistJson: Value(checklistJson),
    );
  }

  factory Ceremony.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ceremony(
      id: serializer.fromJson<String>(json['id']),
      weddingId: serializer.fromJson<String>(json['weddingId']),
      name: serializer.fromJson<String>(json['name']),
      side: serializer.fromJson<String>(json['side']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      date: serializer.fromJson<DateTime?>(json['date']),
      time: serializer.fromJson<String?>(json['time']),
      venue: serializer.fromJson<String>(json['venue']),
      dress: serializer.fromJson<String>(json['dress']),
      jewelry: serializer.fromJson<String>(json['jewelry']),
      budget: serializer.fromJson<double>(json['budget']),
      notes: serializer.fromJson<String>(json['notes']),
      isSkipped: serializer.fromJson<bool>(json['isSkipped']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      checklistJson: serializer.fromJson<String>(json['checklistJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weddingId': serializer.toJson<String>(weddingId),
      'name': serializer.toJson<String>(name),
      'side': serializer.toJson<String>(side),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'date': serializer.toJson<DateTime?>(date),
      'time': serializer.toJson<String?>(time),
      'venue': serializer.toJson<String>(venue),
      'dress': serializer.toJson<String>(dress),
      'jewelry': serializer.toJson<String>(jewelry),
      'budget': serializer.toJson<double>(budget),
      'notes': serializer.toJson<String>(notes),
      'isSkipped': serializer.toJson<bool>(isSkipped),
      'isCustom': serializer.toJson<bool>(isCustom),
      'checklistJson': serializer.toJson<String>(checklistJson),
    };
  }

  Ceremony copyWith({
    String? id,
    String? weddingId,
    String? name,
    String? side,
    int? sortOrder,
    Value<DateTime?> date = const Value.absent(),
    Value<String?> time = const Value.absent(),
    String? venue,
    String? dress,
    String? jewelry,
    double? budget,
    String? notes,
    bool? isSkipped,
    bool? isCustom,
    String? checklistJson,
  }) => Ceremony(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    name: name ?? this.name,
    side: side ?? this.side,
    sortOrder: sortOrder ?? this.sortOrder,
    date: date.present ? date.value : this.date,
    time: time.present ? time.value : this.time,
    venue: venue ?? this.venue,
    dress: dress ?? this.dress,
    jewelry: jewelry ?? this.jewelry,
    budget: budget ?? this.budget,
    notes: notes ?? this.notes,
    isSkipped: isSkipped ?? this.isSkipped,
    isCustom: isCustom ?? this.isCustom,
    checklistJson: checklistJson ?? this.checklistJson,
  );
  Ceremony copyWithCompanion(CeremoniesCompanion data) {
    return Ceremony(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      name: data.name.present ? data.name.value : this.name,
      side: data.side.present ? data.side.value : this.side,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      date: data.date.present ? data.date.value : this.date,
      time: data.time.present ? data.time.value : this.time,
      venue: data.venue.present ? data.venue.value : this.venue,
      dress: data.dress.present ? data.dress.value : this.dress,
      jewelry: data.jewelry.present ? data.jewelry.value : this.jewelry,
      budget: data.budget.present ? data.budget.value : this.budget,
      notes: data.notes.present ? data.notes.value : this.notes,
      isSkipped: data.isSkipped.present ? data.isSkipped.value : this.isSkipped,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      checklistJson: data.checklistJson.present
          ? data.checklistJson.value
          : this.checklistJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ceremony(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('side: $side, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('venue: $venue, ')
          ..write('dress: $dress, ')
          ..write('jewelry: $jewelry, ')
          ..write('budget: $budget, ')
          ..write('notes: $notes, ')
          ..write('isSkipped: $isSkipped, ')
          ..write('isCustom: $isCustom, ')
          ..write('checklistJson: $checklistJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    name,
    side,
    sortOrder,
    date,
    time,
    venue,
    dress,
    jewelry,
    budget,
    notes,
    isSkipped,
    isCustom,
    checklistJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ceremony &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.name == this.name &&
          other.side == this.side &&
          other.sortOrder == this.sortOrder &&
          other.date == this.date &&
          other.time == this.time &&
          other.venue == this.venue &&
          other.dress == this.dress &&
          other.jewelry == this.jewelry &&
          other.budget == this.budget &&
          other.notes == this.notes &&
          other.isSkipped == this.isSkipped &&
          other.isCustom == this.isCustom &&
          other.checklistJson == this.checklistJson);
}

class CeremoniesCompanion extends UpdateCompanion<Ceremony> {
  final Value<String> id;
  final Value<String> weddingId;
  final Value<String> name;
  final Value<String> side;
  final Value<int> sortOrder;
  final Value<DateTime?> date;
  final Value<String?> time;
  final Value<String> venue;
  final Value<String> dress;
  final Value<String> jewelry;
  final Value<double> budget;
  final Value<String> notes;
  final Value<bool> isSkipped;
  final Value<bool> isCustom;
  final Value<String> checklistJson;
  final Value<int> rowid;
  const CeremoniesCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.name = const Value.absent(),
    this.side = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.venue = const Value.absent(),
    this.dress = const Value.absent(),
    this.jewelry = const Value.absent(),
    this.budget = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSkipped = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.checklistJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CeremoniesCompanion.insert({
    required String id,
    required String weddingId,
    required String name,
    required String side,
    required int sortOrder,
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.venue = const Value.absent(),
    this.dress = const Value.absent(),
    this.jewelry = const Value.absent(),
    this.budget = const Value.absent(),
    this.notes = const Value.absent(),
    this.isSkipped = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.checklistJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weddingId = Value(weddingId),
       name = Value(name),
       side = Value(side),
       sortOrder = Value(sortOrder);
  static Insertable<Ceremony> custom({
    Expression<String>? id,
    Expression<String>? weddingId,
    Expression<String>? name,
    Expression<String>? side,
    Expression<int>? sortOrder,
    Expression<DateTime>? date,
    Expression<String>? time,
    Expression<String>? venue,
    Expression<String>? dress,
    Expression<String>? jewelry,
    Expression<double>? budget,
    Expression<String>? notes,
    Expression<bool>? isSkipped,
    Expression<bool>? isCustom,
    Expression<String>? checklistJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (name != null) 'name': name,
      if (side != null) 'side': side,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (venue != null) 'venue': venue,
      if (dress != null) 'dress': dress,
      if (jewelry != null) 'jewelry': jewelry,
      if (budget != null) 'budget': budget,
      if (notes != null) 'notes': notes,
      if (isSkipped != null) 'is_skipped': isSkipped,
      if (isCustom != null) 'is_custom': isCustom,
      if (checklistJson != null) 'checklist_json': checklistJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CeremoniesCompanion copyWith({
    Value<String>? id,
    Value<String>? weddingId,
    Value<String>? name,
    Value<String>? side,
    Value<int>? sortOrder,
    Value<DateTime?>? date,
    Value<String?>? time,
    Value<String>? venue,
    Value<String>? dress,
    Value<String>? jewelry,
    Value<double>? budget,
    Value<String>? notes,
    Value<bool>? isSkipped,
    Value<bool>? isCustom,
    Value<String>? checklistJson,
    Value<int>? rowid,
  }) {
    return CeremoniesCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      name: name ?? this.name,
      side: side ?? this.side,
      sortOrder: sortOrder ?? this.sortOrder,
      date: date ?? this.date,
      time: time ?? this.time,
      venue: venue ?? this.venue,
      dress: dress ?? this.dress,
      jewelry: jewelry ?? this.jewelry,
      budget: budget ?? this.budget,
      notes: notes ?? this.notes,
      isSkipped: isSkipped ?? this.isSkipped,
      isCustom: isCustom ?? this.isCustom,
      checklistJson: checklistJson ?? this.checklistJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<String>(weddingId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (side.present) {
      map['side'] = Variable<String>(side.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (venue.present) {
      map['venue'] = Variable<String>(venue.value);
    }
    if (dress.present) {
      map['dress'] = Variable<String>(dress.value);
    }
    if (jewelry.present) {
      map['jewelry'] = Variable<String>(jewelry.value);
    }
    if (budget.present) {
      map['budget'] = Variable<double>(budget.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isSkipped.present) {
      map['is_skipped'] = Variable<bool>(isSkipped.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (checklistJson.present) {
      map['checklist_json'] = Variable<String>(checklistJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CeremoniesCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('side: $side, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('venue: $venue, ')
          ..write('dress: $dress, ')
          ..write('jewelry: $jewelry, ')
          ..write('budget: $budget, ')
          ..write('notes: $notes, ')
          ..write('isSkipped: $isSkipped, ')
          ..write('isCustom: $isCustom, ')
          ..write('checklistJson: $checklistJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetItemsTable extends BudgetItems
    with TableInfo<$BudgetItemsTable, BudgetItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<String> weddingId = GeneratedColumn<String>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estimatedMeta = const VerificationMeta(
    'estimated',
  );
  @override
  late final GeneratedColumn<double> estimated = GeneratedColumn<double>(
    'estimated',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actualMeta = const VerificationMeta('actual');
  @override
  late final GeneratedColumn<double> actual = GeneratedColumn<double>(
    'actual',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _paidMeta = const VerificationMeta('paid');
  @override
  late final GeneratedColumn<double> paid = GeneratedColumn<double>(
    'paid',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  @override
  late final GeneratedColumn<String> vendor = GeneratedColumn<String>(
    'vendor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    category,
    estimated,
    actual,
    paid,
    vendor,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budget_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<BudgetItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('estimated')) {
      context.handle(
        _estimatedMeta,
        estimated.isAcceptableOrUnknown(data['estimated']!, _estimatedMeta),
      );
    } else if (isInserting) {
      context.missing(_estimatedMeta);
    }
    if (data.containsKey('actual')) {
      context.handle(
        _actualMeta,
        actual.isAcceptableOrUnknown(data['actual']!, _actualMeta),
      );
    }
    if (data.containsKey('paid')) {
      context.handle(
        _paidMeta,
        paid.isAcceptableOrUnknown(data['paid']!, _paidMeta),
      );
    }
    if (data.containsKey('vendor')) {
      context.handle(
        _vendorMeta,
        vendor.isAcceptableOrUnknown(data['vendor']!, _vendorMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wedding_id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      estimated: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}estimated'],
      )!,
      actual: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}actual'],
      )!,
      paid: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}paid'],
      )!,
      vendor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vendor'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $BudgetItemsTable createAlias(String alias) {
    return $BudgetItemsTable(attachedDatabase, alias);
  }
}

class BudgetItem extends DataClass implements Insertable<BudgetItem> {
  final String id;
  final String weddingId;
  final String category;
  final double estimated;
  final double actual;
  final double paid;
  final String vendor;
  final String notes;
  const BudgetItem({
    required this.id,
    required this.weddingId,
    required this.category,
    required this.estimated,
    required this.actual,
    required this.paid,
    required this.vendor,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['wedding_id'] = Variable<String>(weddingId);
    map['category'] = Variable<String>(category);
    map['estimated'] = Variable<double>(estimated);
    map['actual'] = Variable<double>(actual);
    map['paid'] = Variable<double>(paid);
    map['vendor'] = Variable<String>(vendor);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  BudgetItemsCompanion toCompanion(bool nullToAbsent) {
    return BudgetItemsCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      category: Value(category),
      estimated: Value(estimated),
      actual: Value(actual),
      paid: Value(paid),
      vendor: Value(vendor),
      notes: Value(notes),
    );
  }

  factory BudgetItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetItem(
      id: serializer.fromJson<String>(json['id']),
      weddingId: serializer.fromJson<String>(json['weddingId']),
      category: serializer.fromJson<String>(json['category']),
      estimated: serializer.fromJson<double>(json['estimated']),
      actual: serializer.fromJson<double>(json['actual']),
      paid: serializer.fromJson<double>(json['paid']),
      vendor: serializer.fromJson<String>(json['vendor']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weddingId': serializer.toJson<String>(weddingId),
      'category': serializer.toJson<String>(category),
      'estimated': serializer.toJson<double>(estimated),
      'actual': serializer.toJson<double>(actual),
      'paid': serializer.toJson<double>(paid),
      'vendor': serializer.toJson<String>(vendor),
      'notes': serializer.toJson<String>(notes),
    };
  }

  BudgetItem copyWith({
    String? id,
    String? weddingId,
    String? category,
    double? estimated,
    double? actual,
    double? paid,
    String? vendor,
    String? notes,
  }) => BudgetItem(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    category: category ?? this.category,
    estimated: estimated ?? this.estimated,
    actual: actual ?? this.actual,
    paid: paid ?? this.paid,
    vendor: vendor ?? this.vendor,
    notes: notes ?? this.notes,
  );
  BudgetItem copyWithCompanion(BudgetItemsCompanion data) {
    return BudgetItem(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      category: data.category.present ? data.category.value : this.category,
      estimated: data.estimated.present ? data.estimated.value : this.estimated,
      actual: data.actual.present ? data.actual.value : this.actual,
      paid: data.paid.present ? data.paid.value : this.paid,
      vendor: data.vendor.present ? data.vendor.value : this.vendor,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetItem(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('category: $category, ')
          ..write('estimated: $estimated, ')
          ..write('actual: $actual, ')
          ..write('paid: $paid, ')
          ..write('vendor: $vendor, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    category,
    estimated,
    actual,
    paid,
    vendor,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetItem &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.category == this.category &&
          other.estimated == this.estimated &&
          other.actual == this.actual &&
          other.paid == this.paid &&
          other.vendor == this.vendor &&
          other.notes == this.notes);
}

class BudgetItemsCompanion extends UpdateCompanion<BudgetItem> {
  final Value<String> id;
  final Value<String> weddingId;
  final Value<String> category;
  final Value<double> estimated;
  final Value<double> actual;
  final Value<double> paid;
  final Value<String> vendor;
  final Value<String> notes;
  final Value<int> rowid;
  const BudgetItemsCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.category = const Value.absent(),
    this.estimated = const Value.absent(),
    this.actual = const Value.absent(),
    this.paid = const Value.absent(),
    this.vendor = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetItemsCompanion.insert({
    required String id,
    required String weddingId,
    required String category,
    required double estimated,
    this.actual = const Value.absent(),
    this.paid = const Value.absent(),
    this.vendor = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weddingId = Value(weddingId),
       category = Value(category),
       estimated = Value(estimated);
  static Insertable<BudgetItem> custom({
    Expression<String>? id,
    Expression<String>? weddingId,
    Expression<String>? category,
    Expression<double>? estimated,
    Expression<double>? actual,
    Expression<double>? paid,
    Expression<String>? vendor,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (category != null) 'category': category,
      if (estimated != null) 'estimated': estimated,
      if (actual != null) 'actual': actual,
      if (paid != null) 'paid': paid,
      if (vendor != null) 'vendor': vendor,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? weddingId,
    Value<String>? category,
    Value<double>? estimated,
    Value<double>? actual,
    Value<double>? paid,
    Value<String>? vendor,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return BudgetItemsCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      category: category ?? this.category,
      estimated: estimated ?? this.estimated,
      actual: actual ?? this.actual,
      paid: paid ?? this.paid,
      vendor: vendor ?? this.vendor,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<String>(weddingId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (estimated.present) {
      map['estimated'] = Variable<double>(estimated.value);
    }
    if (actual.present) {
      map['actual'] = Variable<double>(actual.value);
    }
    if (paid.present) {
      map['paid'] = Variable<double>(paid.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetItemsCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('category: $category, ')
          ..write('estimated: $estimated, ')
          ..write('actual: $actual, ')
          ..write('paid: $paid, ')
          ..write('vendor: $vendor, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<String> weddingId = GeneratedColumn<String>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  @override
  late final GeneratedColumn<String> vendor = GeneratedColumn<String>(
    'vendor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _gstMeta = const VerificationMeta('gst');
  @override
  late final GeneratedColumn<double> gst = GeneratedColumn<double>(
    'gst',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Cash'),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    title,
    amount,
    category,
    date,
    vendor,
    gst,
    paymentMethod,
    dueDate,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Expense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('vendor')) {
      context.handle(
        _vendorMeta,
        vendor.isAcceptableOrUnknown(data['vendor']!, _vendorMeta),
      );
    }
    if (data.containsKey('gst')) {
      context.handle(
        _gstMeta,
        gst.isAcceptableOrUnknown(data['gst']!, _gstMeta),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wedding_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      vendor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vendor'],
      )!,
      gst: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gst'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final String id;
  final String weddingId;
  final String title;
  final double amount;
  final String category;
  final DateTime date;
  final String vendor;
  final double gst;
  final String paymentMethod;
  final DateTime? dueDate;
  final String notes;
  const Expense({
    required this.id,
    required this.weddingId,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.vendor,
    required this.gst,
    required this.paymentMethod,
    this.dueDate,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['wedding_id'] = Variable<String>(weddingId);
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<double>(amount);
    map['category'] = Variable<String>(category);
    map['date'] = Variable<DateTime>(date);
    map['vendor'] = Variable<String>(vendor);
    map['gst'] = Variable<double>(gst);
    map['payment_method'] = Variable<String>(paymentMethod);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['notes'] = Variable<String>(notes);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      title: Value(title),
      amount: Value(amount),
      category: Value(category),
      date: Value(date),
      vendor: Value(vendor),
      gst: Value(gst),
      paymentMethod: Value(paymentMethod),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      notes: Value(notes),
    );
  }

  factory Expense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<String>(json['id']),
      weddingId: serializer.fromJson<String>(json['weddingId']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<double>(json['amount']),
      category: serializer.fromJson<String>(json['category']),
      date: serializer.fromJson<DateTime>(json['date']),
      vendor: serializer.fromJson<String>(json['vendor']),
      gst: serializer.fromJson<double>(json['gst']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weddingId': serializer.toJson<String>(weddingId),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<double>(amount),
      'category': serializer.toJson<String>(category),
      'date': serializer.toJson<DateTime>(date),
      'vendor': serializer.toJson<String>(vendor),
      'gst': serializer.toJson<double>(gst),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'notes': serializer.toJson<String>(notes),
    };
  }

  Expense copyWith({
    String? id,
    String? weddingId,
    String? title,
    double? amount,
    String? category,
    DateTime? date,
    String? vendor,
    double? gst,
    String? paymentMethod,
    Value<DateTime?> dueDate = const Value.absent(),
    String? notes,
  }) => Expense(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    title: title ?? this.title,
    amount: amount ?? this.amount,
    category: category ?? this.category,
    date: date ?? this.date,
    vendor: vendor ?? this.vendor,
    gst: gst ?? this.gst,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    notes: notes ?? this.notes,
  );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      title: data.title.present ? data.title.value : this.title,
      amount: data.amount.present ? data.amount.value : this.amount,
      category: data.category.present ? data.category.value : this.category,
      date: data.date.present ? data.date.value : this.date,
      vendor: data.vendor.present ? data.vendor.value : this.vendor,
      gst: data.gst.present ? data.gst.value : this.gst,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('vendor: $vendor, ')
          ..write('gst: $gst, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('dueDate: $dueDate, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    title,
    amount,
    category,
    date,
    vendor,
    gst,
    paymentMethod,
    dueDate,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.category == this.category &&
          other.date == this.date &&
          other.vendor == this.vendor &&
          other.gst == this.gst &&
          other.paymentMethod == this.paymentMethod &&
          other.dueDate == this.dueDate &&
          other.notes == this.notes);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<String> id;
  final Value<String> weddingId;
  final Value<String> title;
  final Value<double> amount;
  final Value<String> category;
  final Value<DateTime> date;
  final Value<String> vendor;
  final Value<double> gst;
  final Value<String> paymentMethod;
  final Value<DateTime?> dueDate;
  final Value<String> notes;
  final Value<int> rowid;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
    this.vendor = const Value.absent(),
    this.gst = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesCompanion.insert({
    required String id,
    required String weddingId,
    required String title,
    required double amount,
    required String category,
    required DateTime date,
    this.vendor = const Value.absent(),
    this.gst = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weddingId = Value(weddingId),
       title = Value(title),
       amount = Value(amount),
       category = Value(category),
       date = Value(date);
  static Insertable<Expense> custom({
    Expression<String>? id,
    Expression<String>? weddingId,
    Expression<String>? title,
    Expression<double>? amount,
    Expression<String>? category,
    Expression<DateTime>? date,
    Expression<String>? vendor,
    Expression<double>? gst,
    Expression<String>? paymentMethod,
    Expression<DateTime>? dueDate,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (category != null) 'category': category,
      if (date != null) 'date': date,
      if (vendor != null) 'vendor': vendor,
      if (gst != null) 'gst': gst,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (dueDate != null) 'due_date': dueDate,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesCompanion copyWith({
    Value<String>? id,
    Value<String>? weddingId,
    Value<String>? title,
    Value<double>? amount,
    Value<String>? category,
    Value<DateTime>? date,
    Value<String>? vendor,
    Value<double>? gst,
    Value<String>? paymentMethod,
    Value<DateTime?>? dueDate,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return ExpensesCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      vendor: vendor ?? this.vendor,
      gst: gst ?? this.gst,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      dueDate: dueDate ?? this.dueDate,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<String>(weddingId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (gst.present) {
      map['gst'] = Variable<double>(gst.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('vendor: $vendor, ')
          ..write('gst: $gst, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('dueDate: $dueDate, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GuestsTable extends Guests with TableInfo<$GuestsTable, Guest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<String> weddingId = GeneratedColumn<String>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sideMeta = const VerificationMeta('side');
  @override
  late final GeneratedColumn<String> side = GeneratedColumn<String>(
    'side',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _rsvpStatusMeta = const VerificationMeta(
    'rsvpStatus',
  );
  @override
  late final GeneratedColumn<String> rsvpStatus = GeneratedColumn<String>(
    'rsvp_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _foodPreferenceMeta = const VerificationMeta(
    'foodPreference',
  );
  @override
  late final GeneratedColumn<String> foodPreference = GeneratedColumn<String>(
    'food_preference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('veg'),
  );
  static const VerificationMeta _invitationSentMeta = const VerificationMeta(
    'invitationSent',
  );
  @override
  late final GeneratedColumn<bool> invitationSent = GeneratedColumn<bool>(
    'invitation_sent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("invitation_sent" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _roomAllocationMeta = const VerificationMeta(
    'roomAllocation',
  );
  @override
  late final GeneratedColumn<String> roomAllocation = GeneratedColumn<String>(
    'room_allocation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _tableNumberMeta = const VerificationMeta(
    'tableNumber',
  );
  @override
  late final GeneratedColumn<String> tableNumber = GeneratedColumn<String>(
    'table_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _giftReceivedMeta = const VerificationMeta(
    'giftReceived',
  );
  @override
  late final GeneratedColumn<String> giftReceived = GeneratedColumn<String>(
    'gift_received',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _giftValueMeta = const VerificationMeta(
    'giftValue',
  );
  @override
  late final GeneratedColumn<double> giftValue = GeneratedColumn<double>(
    'gift_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _thankYouSentMeta = const VerificationMeta(
    'thankYouSent',
  );
  @override
  late final GeneratedColumn<bool> thankYouSent = GeneratedColumn<bool>(
    'thank_you_sent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("thank_you_sent" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    name,
    side,
    phone,
    email,
    rsvpStatus,
    foodPreference,
    invitationSent,
    roomAllocation,
    tableNumber,
    giftReceived,
    giftValue,
    thankYouSent,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guests';
  @override
  VerificationContext validateIntegrity(
    Insertable<Guest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('side')) {
      context.handle(
        _sideMeta,
        side.isAcceptableOrUnknown(data['side']!, _sideMeta),
      );
    } else if (isInserting) {
      context.missing(_sideMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('rsvp_status')) {
      context.handle(
        _rsvpStatusMeta,
        rsvpStatus.isAcceptableOrUnknown(data['rsvp_status']!, _rsvpStatusMeta),
      );
    }
    if (data.containsKey('food_preference')) {
      context.handle(
        _foodPreferenceMeta,
        foodPreference.isAcceptableOrUnknown(
          data['food_preference']!,
          _foodPreferenceMeta,
        ),
      );
    }
    if (data.containsKey('invitation_sent')) {
      context.handle(
        _invitationSentMeta,
        invitationSent.isAcceptableOrUnknown(
          data['invitation_sent']!,
          _invitationSentMeta,
        ),
      );
    }
    if (data.containsKey('room_allocation')) {
      context.handle(
        _roomAllocationMeta,
        roomAllocation.isAcceptableOrUnknown(
          data['room_allocation']!,
          _roomAllocationMeta,
        ),
      );
    }
    if (data.containsKey('table_number')) {
      context.handle(
        _tableNumberMeta,
        tableNumber.isAcceptableOrUnknown(
          data['table_number']!,
          _tableNumberMeta,
        ),
      );
    }
    if (data.containsKey('gift_received')) {
      context.handle(
        _giftReceivedMeta,
        giftReceived.isAcceptableOrUnknown(
          data['gift_received']!,
          _giftReceivedMeta,
        ),
      );
    }
    if (data.containsKey('gift_value')) {
      context.handle(
        _giftValueMeta,
        giftValue.isAcceptableOrUnknown(data['gift_value']!, _giftValueMeta),
      );
    }
    if (data.containsKey('thank_you_sent')) {
      context.handle(
        _thankYouSentMeta,
        thankYouSent.isAcceptableOrUnknown(
          data['thank_you_sent']!,
          _thankYouSentMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Guest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Guest(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wedding_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      side: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      rsvpStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rsvp_status'],
      )!,
      foodPreference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_preference'],
      )!,
      invitationSent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}invitation_sent'],
      )!,
      roomAllocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_allocation'],
      )!,
      tableNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}table_number'],
      )!,
      giftReceived: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gift_received'],
      )!,
      giftValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gift_value'],
      )!,
      thankYouSent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}thank_you_sent'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $GuestsTable createAlias(String alias) {
    return $GuestsTable(attachedDatabase, alias);
  }
}

class Guest extends DataClass implements Insertable<Guest> {
  final String id;
  final String weddingId;
  final String name;
  final String side;
  final String phone;
  final String email;
  final String rsvpStatus;
  final String foodPreference;
  final bool invitationSent;
  final String roomAllocation;
  final String tableNumber;
  final String giftReceived;
  final double giftValue;
  final bool thankYouSent;
  final String notes;
  const Guest({
    required this.id,
    required this.weddingId,
    required this.name,
    required this.side,
    required this.phone,
    required this.email,
    required this.rsvpStatus,
    required this.foodPreference,
    required this.invitationSent,
    required this.roomAllocation,
    required this.tableNumber,
    required this.giftReceived,
    required this.giftValue,
    required this.thankYouSent,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['wedding_id'] = Variable<String>(weddingId);
    map['name'] = Variable<String>(name);
    map['side'] = Variable<String>(side);
    map['phone'] = Variable<String>(phone);
    map['email'] = Variable<String>(email);
    map['rsvp_status'] = Variable<String>(rsvpStatus);
    map['food_preference'] = Variable<String>(foodPreference);
    map['invitation_sent'] = Variable<bool>(invitationSent);
    map['room_allocation'] = Variable<String>(roomAllocation);
    map['table_number'] = Variable<String>(tableNumber);
    map['gift_received'] = Variable<String>(giftReceived);
    map['gift_value'] = Variable<double>(giftValue);
    map['thank_you_sent'] = Variable<bool>(thankYouSent);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  GuestsCompanion toCompanion(bool nullToAbsent) {
    return GuestsCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      name: Value(name),
      side: Value(side),
      phone: Value(phone),
      email: Value(email),
      rsvpStatus: Value(rsvpStatus),
      foodPreference: Value(foodPreference),
      invitationSent: Value(invitationSent),
      roomAllocation: Value(roomAllocation),
      tableNumber: Value(tableNumber),
      giftReceived: Value(giftReceived),
      giftValue: Value(giftValue),
      thankYouSent: Value(thankYouSent),
      notes: Value(notes),
    );
  }

  factory Guest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Guest(
      id: serializer.fromJson<String>(json['id']),
      weddingId: serializer.fromJson<String>(json['weddingId']),
      name: serializer.fromJson<String>(json['name']),
      side: serializer.fromJson<String>(json['side']),
      phone: serializer.fromJson<String>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      rsvpStatus: serializer.fromJson<String>(json['rsvpStatus']),
      foodPreference: serializer.fromJson<String>(json['foodPreference']),
      invitationSent: serializer.fromJson<bool>(json['invitationSent']),
      roomAllocation: serializer.fromJson<String>(json['roomAllocation']),
      tableNumber: serializer.fromJson<String>(json['tableNumber']),
      giftReceived: serializer.fromJson<String>(json['giftReceived']),
      giftValue: serializer.fromJson<double>(json['giftValue']),
      thankYouSent: serializer.fromJson<bool>(json['thankYouSent']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weddingId': serializer.toJson<String>(weddingId),
      'name': serializer.toJson<String>(name),
      'side': serializer.toJson<String>(side),
      'phone': serializer.toJson<String>(phone),
      'email': serializer.toJson<String>(email),
      'rsvpStatus': serializer.toJson<String>(rsvpStatus),
      'foodPreference': serializer.toJson<String>(foodPreference),
      'invitationSent': serializer.toJson<bool>(invitationSent),
      'roomAllocation': serializer.toJson<String>(roomAllocation),
      'tableNumber': serializer.toJson<String>(tableNumber),
      'giftReceived': serializer.toJson<String>(giftReceived),
      'giftValue': serializer.toJson<double>(giftValue),
      'thankYouSent': serializer.toJson<bool>(thankYouSent),
      'notes': serializer.toJson<String>(notes),
    };
  }

  Guest copyWith({
    String? id,
    String? weddingId,
    String? name,
    String? side,
    String? phone,
    String? email,
    String? rsvpStatus,
    String? foodPreference,
    bool? invitationSent,
    String? roomAllocation,
    String? tableNumber,
    String? giftReceived,
    double? giftValue,
    bool? thankYouSent,
    String? notes,
  }) => Guest(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    name: name ?? this.name,
    side: side ?? this.side,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    rsvpStatus: rsvpStatus ?? this.rsvpStatus,
    foodPreference: foodPreference ?? this.foodPreference,
    invitationSent: invitationSent ?? this.invitationSent,
    roomAllocation: roomAllocation ?? this.roomAllocation,
    tableNumber: tableNumber ?? this.tableNumber,
    giftReceived: giftReceived ?? this.giftReceived,
    giftValue: giftValue ?? this.giftValue,
    thankYouSent: thankYouSent ?? this.thankYouSent,
    notes: notes ?? this.notes,
  );
  Guest copyWithCompanion(GuestsCompanion data) {
    return Guest(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      name: data.name.present ? data.name.value : this.name,
      side: data.side.present ? data.side.value : this.side,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      rsvpStatus: data.rsvpStatus.present
          ? data.rsvpStatus.value
          : this.rsvpStatus,
      foodPreference: data.foodPreference.present
          ? data.foodPreference.value
          : this.foodPreference,
      invitationSent: data.invitationSent.present
          ? data.invitationSent.value
          : this.invitationSent,
      roomAllocation: data.roomAllocation.present
          ? data.roomAllocation.value
          : this.roomAllocation,
      tableNumber: data.tableNumber.present
          ? data.tableNumber.value
          : this.tableNumber,
      giftReceived: data.giftReceived.present
          ? data.giftReceived.value
          : this.giftReceived,
      giftValue: data.giftValue.present ? data.giftValue.value : this.giftValue,
      thankYouSent: data.thankYouSent.present
          ? data.thankYouSent.value
          : this.thankYouSent,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Guest(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('side: $side, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('rsvpStatus: $rsvpStatus, ')
          ..write('foodPreference: $foodPreference, ')
          ..write('invitationSent: $invitationSent, ')
          ..write('roomAllocation: $roomAllocation, ')
          ..write('tableNumber: $tableNumber, ')
          ..write('giftReceived: $giftReceived, ')
          ..write('giftValue: $giftValue, ')
          ..write('thankYouSent: $thankYouSent, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    name,
    side,
    phone,
    email,
    rsvpStatus,
    foodPreference,
    invitationSent,
    roomAllocation,
    tableNumber,
    giftReceived,
    giftValue,
    thankYouSent,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Guest &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.name == this.name &&
          other.side == this.side &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.rsvpStatus == this.rsvpStatus &&
          other.foodPreference == this.foodPreference &&
          other.invitationSent == this.invitationSent &&
          other.roomAllocation == this.roomAllocation &&
          other.tableNumber == this.tableNumber &&
          other.giftReceived == this.giftReceived &&
          other.giftValue == this.giftValue &&
          other.thankYouSent == this.thankYouSent &&
          other.notes == this.notes);
}

class GuestsCompanion extends UpdateCompanion<Guest> {
  final Value<String> id;
  final Value<String> weddingId;
  final Value<String> name;
  final Value<String> side;
  final Value<String> phone;
  final Value<String> email;
  final Value<String> rsvpStatus;
  final Value<String> foodPreference;
  final Value<bool> invitationSent;
  final Value<String> roomAllocation;
  final Value<String> tableNumber;
  final Value<String> giftReceived;
  final Value<double> giftValue;
  final Value<bool> thankYouSent;
  final Value<String> notes;
  final Value<int> rowid;
  const GuestsCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.name = const Value.absent(),
    this.side = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.rsvpStatus = const Value.absent(),
    this.foodPreference = const Value.absent(),
    this.invitationSent = const Value.absent(),
    this.roomAllocation = const Value.absent(),
    this.tableNumber = const Value.absent(),
    this.giftReceived = const Value.absent(),
    this.giftValue = const Value.absent(),
    this.thankYouSent = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GuestsCompanion.insert({
    required String id,
    required String weddingId,
    required String name,
    required String side,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.rsvpStatus = const Value.absent(),
    this.foodPreference = const Value.absent(),
    this.invitationSent = const Value.absent(),
    this.roomAllocation = const Value.absent(),
    this.tableNumber = const Value.absent(),
    this.giftReceived = const Value.absent(),
    this.giftValue = const Value.absent(),
    this.thankYouSent = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weddingId = Value(weddingId),
       name = Value(name),
       side = Value(side);
  static Insertable<Guest> custom({
    Expression<String>? id,
    Expression<String>? weddingId,
    Expression<String>? name,
    Expression<String>? side,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? rsvpStatus,
    Expression<String>? foodPreference,
    Expression<bool>? invitationSent,
    Expression<String>? roomAllocation,
    Expression<String>? tableNumber,
    Expression<String>? giftReceived,
    Expression<double>? giftValue,
    Expression<bool>? thankYouSent,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (name != null) 'name': name,
      if (side != null) 'side': side,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (rsvpStatus != null) 'rsvp_status': rsvpStatus,
      if (foodPreference != null) 'food_preference': foodPreference,
      if (invitationSent != null) 'invitation_sent': invitationSent,
      if (roomAllocation != null) 'room_allocation': roomAllocation,
      if (tableNumber != null) 'table_number': tableNumber,
      if (giftReceived != null) 'gift_received': giftReceived,
      if (giftValue != null) 'gift_value': giftValue,
      if (thankYouSent != null) 'thank_you_sent': thankYouSent,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GuestsCompanion copyWith({
    Value<String>? id,
    Value<String>? weddingId,
    Value<String>? name,
    Value<String>? side,
    Value<String>? phone,
    Value<String>? email,
    Value<String>? rsvpStatus,
    Value<String>? foodPreference,
    Value<bool>? invitationSent,
    Value<String>? roomAllocation,
    Value<String>? tableNumber,
    Value<String>? giftReceived,
    Value<double>? giftValue,
    Value<bool>? thankYouSent,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return GuestsCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      name: name ?? this.name,
      side: side ?? this.side,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      rsvpStatus: rsvpStatus ?? this.rsvpStatus,
      foodPreference: foodPreference ?? this.foodPreference,
      invitationSent: invitationSent ?? this.invitationSent,
      roomAllocation: roomAllocation ?? this.roomAllocation,
      tableNumber: tableNumber ?? this.tableNumber,
      giftReceived: giftReceived ?? this.giftReceived,
      giftValue: giftValue ?? this.giftValue,
      thankYouSent: thankYouSent ?? this.thankYouSent,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<String>(weddingId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (side.present) {
      map['side'] = Variable<String>(side.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (rsvpStatus.present) {
      map['rsvp_status'] = Variable<String>(rsvpStatus.value);
    }
    if (foodPreference.present) {
      map['food_preference'] = Variable<String>(foodPreference.value);
    }
    if (invitationSent.present) {
      map['invitation_sent'] = Variable<bool>(invitationSent.value);
    }
    if (roomAllocation.present) {
      map['room_allocation'] = Variable<String>(roomAllocation.value);
    }
    if (tableNumber.present) {
      map['table_number'] = Variable<String>(tableNumber.value);
    }
    if (giftReceived.present) {
      map['gift_received'] = Variable<String>(giftReceived.value);
    }
    if (giftValue.present) {
      map['gift_value'] = Variable<double>(giftValue.value);
    }
    if (thankYouSent.present) {
      map['thank_you_sent'] = Variable<bool>(thankYouSent.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuestsCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('side: $side, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('rsvpStatus: $rsvpStatus, ')
          ..write('foodPreference: $foodPreference, ')
          ..write('invitationSent: $invitationSent, ')
          ..write('roomAllocation: $roomAllocation, ')
          ..write('tableNumber: $tableNumber, ')
          ..write('giftReceived: $giftReceived, ')
          ..write('giftValue: $giftValue, ')
          ..write('thankYouSent: $thankYouSent, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TimelineTasksTable extends TimelineTasks
    with TableInfo<$TimelineTasksTable, TimelineTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimelineTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<String> weddingId = GeneratedColumn<String>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stageMeta = const VerificationMeta('stage');
  @override
  late final GeneratedColumn<String> stage = GeneratedColumn<String>(
    'stage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    stage,
    title,
    isCompleted,
    dueDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timeline_tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimelineTask> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('stage')) {
      context.handle(
        _stageMeta,
        stage.isAcceptableOrUnknown(data['stage']!, _stageMeta),
      );
    } else if (isInserting) {
      context.missing(_stageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimelineTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimelineTask(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wedding_id'],
      )!,
      stage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stage'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
    );
  }

  @override
  $TimelineTasksTable createAlias(String alias) {
    return $TimelineTasksTable(attachedDatabase, alias);
  }
}

class TimelineTask extends DataClass implements Insertable<TimelineTask> {
  final String id;
  final String weddingId;
  final String stage;
  final String title;
  final bool isCompleted;
  final DateTime? dueDate;
  const TimelineTask({
    required this.id,
    required this.weddingId,
    required this.stage,
    required this.title,
    required this.isCompleted,
    this.dueDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['wedding_id'] = Variable<String>(weddingId);
    map['stage'] = Variable<String>(stage);
    map['title'] = Variable<String>(title);
    map['is_completed'] = Variable<bool>(isCompleted);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    return map;
  }

  TimelineTasksCompanion toCompanion(bool nullToAbsent) {
    return TimelineTasksCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      stage: Value(stage),
      title: Value(title),
      isCompleted: Value(isCompleted),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
    );
  }

  factory TimelineTask.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimelineTask(
      id: serializer.fromJson<String>(json['id']),
      weddingId: serializer.fromJson<String>(json['weddingId']),
      stage: serializer.fromJson<String>(json['stage']),
      title: serializer.fromJson<String>(json['title']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weddingId': serializer.toJson<String>(weddingId),
      'stage': serializer.toJson<String>(stage),
      'title': serializer.toJson<String>(title),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
    };
  }

  TimelineTask copyWith({
    String? id,
    String? weddingId,
    String? stage,
    String? title,
    bool? isCompleted,
    Value<DateTime?> dueDate = const Value.absent(),
  }) => TimelineTask(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    stage: stage ?? this.stage,
    title: title ?? this.title,
    isCompleted: isCompleted ?? this.isCompleted,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
  );
  TimelineTask copyWithCompanion(TimelineTasksCompanion data) {
    return TimelineTask(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      stage: data.stage.present ? data.stage.value : this.stage,
      title: data.title.present ? data.title.value : this.title,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimelineTask(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('stage: $stage, ')
          ..write('title: $title, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, weddingId, stage, title, isCompleted, dueDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimelineTask &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.stage == this.stage &&
          other.title == this.title &&
          other.isCompleted == this.isCompleted &&
          other.dueDate == this.dueDate);
}

class TimelineTasksCompanion extends UpdateCompanion<TimelineTask> {
  final Value<String> id;
  final Value<String> weddingId;
  final Value<String> stage;
  final Value<String> title;
  final Value<bool> isCompleted;
  final Value<DateTime?> dueDate;
  final Value<int> rowid;
  const TimelineTasksCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.stage = const Value.absent(),
    this.title = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimelineTasksCompanion.insert({
    required String id,
    required String weddingId,
    required String stage,
    required String title,
    this.isCompleted = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weddingId = Value(weddingId),
       stage = Value(stage),
       title = Value(title);
  static Insertable<TimelineTask> custom({
    Expression<String>? id,
    Expression<String>? weddingId,
    Expression<String>? stage,
    Expression<String>? title,
    Expression<bool>? isCompleted,
    Expression<DateTime>? dueDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (stage != null) 'stage': stage,
      if (title != null) 'title': title,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (dueDate != null) 'due_date': dueDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimelineTasksCompanion copyWith({
    Value<String>? id,
    Value<String>? weddingId,
    Value<String>? stage,
    Value<String>? title,
    Value<bool>? isCompleted,
    Value<DateTime?>? dueDate,
    Value<int>? rowid,
  }) {
    return TimelineTasksCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      stage: stage ?? this.stage,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<String>(weddingId.value);
    }
    if (stage.present) {
      map['stage'] = Variable<String>(stage.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimelineTasksCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('stage: $stage, ')
          ..write('title: $title, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dueDate: $dueDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WeddingsTable weddings = $WeddingsTable(this);
  late final $CeremoniesTable ceremonies = $CeremoniesTable(this);
  late final $BudgetItemsTable budgetItems = $BudgetItemsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $GuestsTable guests = $GuestsTable(this);
  late final $TimelineTasksTable timelineTasks = $TimelineTasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    weddings,
    ceremonies,
    budgetItems,
    expenses,
    guests,
    timelineTasks,
  ];
}

typedef $$WeddingsTableCreateCompanionBuilder =
    WeddingsCompanion Function({
      required String id,
      required String brideName,
      required String groomName,
      required DateTime weddingDate,
      required String location,
      required String weddingType,
      required double budget,
      required int guestCount,
      required String religion,
      required String tradition,
      required String currency,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$WeddingsTableUpdateCompanionBuilder =
    WeddingsCompanion Function({
      Value<String> id,
      Value<String> brideName,
      Value<String> groomName,
      Value<DateTime> weddingDate,
      Value<String> location,
      Value<String> weddingType,
      Value<double> budget,
      Value<int> guestCount,
      Value<String> religion,
      Value<String> tradition,
      Value<String> currency,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$WeddingsTableFilterComposer
    extends Composer<_$AppDatabase, $WeddingsTable> {
  $$WeddingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brideName => $composableBuilder(
    column: $table.brideName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groomName => $composableBuilder(
    column: $table.groomName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get weddingDate => $composableBuilder(
    column: $table.weddingDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weddingType => $composableBuilder(
    column: $table.weddingType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get religion => $composableBuilder(
    column: $table.religion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tradition => $composableBuilder(
    column: $table.tradition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeddingsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeddingsTable> {
  $$WeddingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brideName => $composableBuilder(
    column: $table.brideName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groomName => $composableBuilder(
    column: $table.groomName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get weddingDate => $composableBuilder(
    column: $table.weddingDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weddingType => $composableBuilder(
    column: $table.weddingType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get religion => $composableBuilder(
    column: $table.religion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tradition => $composableBuilder(
    column: $table.tradition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeddingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeddingsTable> {
  $$WeddingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get brideName =>
      $composableBuilder(column: $table.brideName, builder: (column) => column);

  GeneratedColumn<String> get groomName =>
      $composableBuilder(column: $table.groomName, builder: (column) => column);

  GeneratedColumn<DateTime> get weddingDate => $composableBuilder(
    column: $table.weddingDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get weddingType => $composableBuilder(
    column: $table.weddingType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  GeneratedColumn<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get religion =>
      $composableBuilder(column: $table.religion, builder: (column) => column);

  GeneratedColumn<String> get tradition =>
      $composableBuilder(column: $table.tradition, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WeddingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeddingsTable,
          Wedding,
          $$WeddingsTableFilterComposer,
          $$WeddingsTableOrderingComposer,
          $$WeddingsTableAnnotationComposer,
          $$WeddingsTableCreateCompanionBuilder,
          $$WeddingsTableUpdateCompanionBuilder,
          (Wedding, BaseReferences<_$AppDatabase, $WeddingsTable, Wedding>),
          Wedding,
          PrefetchHooks Function()
        > {
  $$WeddingsTableTableManager(_$AppDatabase db, $WeddingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeddingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeddingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeddingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> brideName = const Value.absent(),
                Value<String> groomName = const Value.absent(),
                Value<DateTime> weddingDate = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> weddingType = const Value.absent(),
                Value<double> budget = const Value.absent(),
                Value<int> guestCount = const Value.absent(),
                Value<String> religion = const Value.absent(),
                Value<String> tradition = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeddingsCompanion(
                id: id,
                brideName: brideName,
                groomName: groomName,
                weddingDate: weddingDate,
                location: location,
                weddingType: weddingType,
                budget: budget,
                guestCount: guestCount,
                religion: religion,
                tradition: tradition,
                currency: currency,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String brideName,
                required String groomName,
                required DateTime weddingDate,
                required String location,
                required String weddingType,
                required double budget,
                required int guestCount,
                required String religion,
                required String tradition,
                required String currency,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeddingsCompanion.insert(
                id: id,
                brideName: brideName,
                groomName: groomName,
                weddingDate: weddingDate,
                location: location,
                weddingType: weddingType,
                budget: budget,
                guestCount: guestCount,
                religion: religion,
                tradition: tradition,
                currency: currency,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeddingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeddingsTable,
      Wedding,
      $$WeddingsTableFilterComposer,
      $$WeddingsTableOrderingComposer,
      $$WeddingsTableAnnotationComposer,
      $$WeddingsTableCreateCompanionBuilder,
      $$WeddingsTableUpdateCompanionBuilder,
      (Wedding, BaseReferences<_$AppDatabase, $WeddingsTable, Wedding>),
      Wedding,
      PrefetchHooks Function()
    >;
typedef $$CeremoniesTableCreateCompanionBuilder =
    CeremoniesCompanion Function({
      required String id,
      required String weddingId,
      required String name,
      required String side,
      required int sortOrder,
      Value<DateTime?> date,
      Value<String?> time,
      Value<String> venue,
      Value<String> dress,
      Value<String> jewelry,
      Value<double> budget,
      Value<String> notes,
      Value<bool> isSkipped,
      Value<bool> isCustom,
      Value<String> checklistJson,
      Value<int> rowid,
    });
typedef $$CeremoniesTableUpdateCompanionBuilder =
    CeremoniesCompanion Function({
      Value<String> id,
      Value<String> weddingId,
      Value<String> name,
      Value<String> side,
      Value<int> sortOrder,
      Value<DateTime?> date,
      Value<String?> time,
      Value<String> venue,
      Value<String> dress,
      Value<String> jewelry,
      Value<double> budget,
      Value<String> notes,
      Value<bool> isSkipped,
      Value<bool> isCustom,
      Value<String> checklistJson,
      Value<int> rowid,
    });

class $$CeremoniesTableFilterComposer
    extends Composer<_$AppDatabase, $CeremoniesTable> {
  $$CeremoniesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get venue => $composableBuilder(
    column: $table.venue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dress => $composableBuilder(
    column: $table.dress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jewelry => $composableBuilder(
    column: $table.jewelry,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSkipped => $composableBuilder(
    column: $table.isSkipped,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checklistJson => $composableBuilder(
    column: $table.checklistJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CeremoniesTableOrderingComposer
    extends Composer<_$AppDatabase, $CeremoniesTable> {
  $$CeremoniesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get venue => $composableBuilder(
    column: $table.venue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dress => $composableBuilder(
    column: $table.dress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jewelry => $composableBuilder(
    column: $table.jewelry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get budget => $composableBuilder(
    column: $table.budget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSkipped => $composableBuilder(
    column: $table.isSkipped,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checklistJson => $composableBuilder(
    column: $table.checklistJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CeremoniesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CeremoniesTable> {
  $$CeremoniesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get weddingId =>
      $composableBuilder(column: $table.weddingId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get side =>
      $composableBuilder(column: $table.side, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<String> get venue =>
      $composableBuilder(column: $table.venue, builder: (column) => column);

  GeneratedColumn<String> get dress =>
      $composableBuilder(column: $table.dress, builder: (column) => column);

  GeneratedColumn<String> get jewelry =>
      $composableBuilder(column: $table.jewelry, builder: (column) => column);

  GeneratedColumn<double> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isSkipped =>
      $composableBuilder(column: $table.isSkipped, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<String> get checklistJson => $composableBuilder(
    column: $table.checklistJson,
    builder: (column) => column,
  );
}

class $$CeremoniesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CeremoniesTable,
          Ceremony,
          $$CeremoniesTableFilterComposer,
          $$CeremoniesTableOrderingComposer,
          $$CeremoniesTableAnnotationComposer,
          $$CeremoniesTableCreateCompanionBuilder,
          $$CeremoniesTableUpdateCompanionBuilder,
          (Ceremony, BaseReferences<_$AppDatabase, $CeremoniesTable, Ceremony>),
          Ceremony,
          PrefetchHooks Function()
        > {
  $$CeremoniesTableTableManager(_$AppDatabase db, $CeremoniesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CeremoniesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CeremoniesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CeremoniesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> weddingId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> side = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime?> date = const Value.absent(),
                Value<String?> time = const Value.absent(),
                Value<String> venue = const Value.absent(),
                Value<String> dress = const Value.absent(),
                Value<String> jewelry = const Value.absent(),
                Value<double> budget = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<bool> isSkipped = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<String> checklistJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CeremoniesCompanion(
                id: id,
                weddingId: weddingId,
                name: name,
                side: side,
                sortOrder: sortOrder,
                date: date,
                time: time,
                venue: venue,
                dress: dress,
                jewelry: jewelry,
                budget: budget,
                notes: notes,
                isSkipped: isSkipped,
                isCustom: isCustom,
                checklistJson: checklistJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String weddingId,
                required String name,
                required String side,
                required int sortOrder,
                Value<DateTime?> date = const Value.absent(),
                Value<String?> time = const Value.absent(),
                Value<String> venue = const Value.absent(),
                Value<String> dress = const Value.absent(),
                Value<String> jewelry = const Value.absent(),
                Value<double> budget = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<bool> isSkipped = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<String> checklistJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CeremoniesCompanion.insert(
                id: id,
                weddingId: weddingId,
                name: name,
                side: side,
                sortOrder: sortOrder,
                date: date,
                time: time,
                venue: venue,
                dress: dress,
                jewelry: jewelry,
                budget: budget,
                notes: notes,
                isSkipped: isSkipped,
                isCustom: isCustom,
                checklistJson: checklistJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CeremoniesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CeremoniesTable,
      Ceremony,
      $$CeremoniesTableFilterComposer,
      $$CeremoniesTableOrderingComposer,
      $$CeremoniesTableAnnotationComposer,
      $$CeremoniesTableCreateCompanionBuilder,
      $$CeremoniesTableUpdateCompanionBuilder,
      (Ceremony, BaseReferences<_$AppDatabase, $CeremoniesTable, Ceremony>),
      Ceremony,
      PrefetchHooks Function()
    >;
typedef $$BudgetItemsTableCreateCompanionBuilder =
    BudgetItemsCompanion Function({
      required String id,
      required String weddingId,
      required String category,
      required double estimated,
      Value<double> actual,
      Value<double> paid,
      Value<String> vendor,
      Value<String> notes,
      Value<int> rowid,
    });
typedef $$BudgetItemsTableUpdateCompanionBuilder =
    BudgetItemsCompanion Function({
      Value<String> id,
      Value<String> weddingId,
      Value<String> category,
      Value<double> estimated,
      Value<double> actual,
      Value<double> paid,
      Value<String> vendor,
      Value<String> notes,
      Value<int> rowid,
    });

class $$BudgetItemsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get estimated => $composableBuilder(
    column: $table.estimated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actual => $composableBuilder(
    column: $table.actual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get paid => $composableBuilder(
    column: $table.paid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BudgetItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get estimated => $composableBuilder(
    column: $table.estimated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actual => $composableBuilder(
    column: $table.actual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get paid => $composableBuilder(
    column: $table.paid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BudgetItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get weddingId =>
      $composableBuilder(column: $table.weddingId, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get estimated =>
      $composableBuilder(column: $table.estimated, builder: (column) => column);

  GeneratedColumn<double> get actual =>
      $composableBuilder(column: $table.actual, builder: (column) => column);

  GeneratedColumn<double> get paid =>
      $composableBuilder(column: $table.paid, builder: (column) => column);

  GeneratedColumn<String> get vendor =>
      $composableBuilder(column: $table.vendor, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$BudgetItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BudgetItemsTable,
          BudgetItem,
          $$BudgetItemsTableFilterComposer,
          $$BudgetItemsTableOrderingComposer,
          $$BudgetItemsTableAnnotationComposer,
          $$BudgetItemsTableCreateCompanionBuilder,
          $$BudgetItemsTableUpdateCompanionBuilder,
          (
            BudgetItem,
            BaseReferences<_$AppDatabase, $BudgetItemsTable, BudgetItem>,
          ),
          BudgetItem,
          PrefetchHooks Function()
        > {
  $$BudgetItemsTableTableManager(_$AppDatabase db, $BudgetItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> weddingId = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> estimated = const Value.absent(),
                Value<double> actual = const Value.absent(),
                Value<double> paid = const Value.absent(),
                Value<String> vendor = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BudgetItemsCompanion(
                id: id,
                weddingId: weddingId,
                category: category,
                estimated: estimated,
                actual: actual,
                paid: paid,
                vendor: vendor,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String weddingId,
                required String category,
                required double estimated,
                Value<double> actual = const Value.absent(),
                Value<double> paid = const Value.absent(),
                Value<String> vendor = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BudgetItemsCompanion.insert(
                id: id,
                weddingId: weddingId,
                category: category,
                estimated: estimated,
                actual: actual,
                paid: paid,
                vendor: vendor,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BudgetItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BudgetItemsTable,
      BudgetItem,
      $$BudgetItemsTableFilterComposer,
      $$BudgetItemsTableOrderingComposer,
      $$BudgetItemsTableAnnotationComposer,
      $$BudgetItemsTableCreateCompanionBuilder,
      $$BudgetItemsTableUpdateCompanionBuilder,
      (
        BudgetItem,
        BaseReferences<_$AppDatabase, $BudgetItemsTable, BudgetItem>,
      ),
      BudgetItem,
      PrefetchHooks Function()
    >;
typedef $$ExpensesTableCreateCompanionBuilder =
    ExpensesCompanion Function({
      required String id,
      required String weddingId,
      required String title,
      required double amount,
      required String category,
      required DateTime date,
      Value<String> vendor,
      Value<double> gst,
      Value<String> paymentMethod,
      Value<DateTime?> dueDate,
      Value<String> notes,
      Value<int> rowid,
    });
typedef $$ExpensesTableUpdateCompanionBuilder =
    ExpensesCompanion Function({
      Value<String> id,
      Value<String> weddingId,
      Value<String> title,
      Value<double> amount,
      Value<String> category,
      Value<DateTime> date,
      Value<String> vendor,
      Value<double> gst,
      Value<String> paymentMethod,
      Value<DateTime?> dueDate,
      Value<String> notes,
      Value<int> rowid,
    });

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gst => $composableBuilder(
    column: $table.gst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vendor => $composableBuilder(
    column: $table.vendor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gst => $composableBuilder(
    column: $table.gst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get weddingId =>
      $composableBuilder(column: $table.weddingId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get vendor =>
      $composableBuilder(column: $table.vendor, builder: (column) => column);

  GeneratedColumn<double> get gst =>
      $composableBuilder(column: $table.gst, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          Expense,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
          Expense,
          PrefetchHooks Function()
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> weddingId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> vendor = const Value.absent(),
                Value<double> gst = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion(
                id: id,
                weddingId: weddingId,
                title: title,
                amount: amount,
                category: category,
                date: date,
                vendor: vendor,
                gst: gst,
                paymentMethod: paymentMethod,
                dueDate: dueDate,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String weddingId,
                required String title,
                required double amount,
                required String category,
                required DateTime date,
                Value<String> vendor = const Value.absent(),
                Value<double> gst = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion.insert(
                id: id,
                weddingId: weddingId,
                title: title,
                amount: amount,
                category: category,
                date: date,
                vendor: vendor,
                gst: gst,
                paymentMethod: paymentMethod,
                dueDate: dueDate,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      Expense,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
      Expense,
      PrefetchHooks Function()
    >;
typedef $$GuestsTableCreateCompanionBuilder =
    GuestsCompanion Function({
      required String id,
      required String weddingId,
      required String name,
      required String side,
      Value<String> phone,
      Value<String> email,
      Value<String> rsvpStatus,
      Value<String> foodPreference,
      Value<bool> invitationSent,
      Value<String> roomAllocation,
      Value<String> tableNumber,
      Value<String> giftReceived,
      Value<double> giftValue,
      Value<bool> thankYouSent,
      Value<String> notes,
      Value<int> rowid,
    });
typedef $$GuestsTableUpdateCompanionBuilder =
    GuestsCompanion Function({
      Value<String> id,
      Value<String> weddingId,
      Value<String> name,
      Value<String> side,
      Value<String> phone,
      Value<String> email,
      Value<String> rsvpStatus,
      Value<String> foodPreference,
      Value<bool> invitationSent,
      Value<String> roomAllocation,
      Value<String> tableNumber,
      Value<String> giftReceived,
      Value<double> giftValue,
      Value<bool> thankYouSent,
      Value<String> notes,
      Value<int> rowid,
    });

class $$GuestsTableFilterComposer
    extends Composer<_$AppDatabase, $GuestsTable> {
  $$GuestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rsvpStatus => $composableBuilder(
    column: $table.rsvpStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foodPreference => $composableBuilder(
    column: $table.foodPreference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get invitationSent => $composableBuilder(
    column: $table.invitationSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomAllocation => $composableBuilder(
    column: $table.roomAllocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get giftReceived => $composableBuilder(
    column: $table.giftReceived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get giftValue => $composableBuilder(
    column: $table.giftValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get thankYouSent => $composableBuilder(
    column: $table.thankYouSent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GuestsTableOrderingComposer
    extends Composer<_$AppDatabase, $GuestsTable> {
  $$GuestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rsvpStatus => $composableBuilder(
    column: $table.rsvpStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foodPreference => $composableBuilder(
    column: $table.foodPreference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get invitationSent => $composableBuilder(
    column: $table.invitationSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomAllocation => $composableBuilder(
    column: $table.roomAllocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get giftReceived => $composableBuilder(
    column: $table.giftReceived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get giftValue => $composableBuilder(
    column: $table.giftValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get thankYouSent => $composableBuilder(
    column: $table.thankYouSent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GuestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GuestsTable> {
  $$GuestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get weddingId =>
      $composableBuilder(column: $table.weddingId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get side =>
      $composableBuilder(column: $table.side, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get rsvpStatus => $composableBuilder(
    column: $table.rsvpStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get foodPreference => $composableBuilder(
    column: $table.foodPreference,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get invitationSent => $composableBuilder(
    column: $table.invitationSent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roomAllocation => $composableBuilder(
    column: $table.roomAllocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tableNumber => $composableBuilder(
    column: $table.tableNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get giftReceived => $composableBuilder(
    column: $table.giftReceived,
    builder: (column) => column,
  );

  GeneratedColumn<double> get giftValue =>
      $composableBuilder(column: $table.giftValue, builder: (column) => column);

  GeneratedColumn<bool> get thankYouSent => $composableBuilder(
    column: $table.thankYouSent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$GuestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GuestsTable,
          Guest,
          $$GuestsTableFilterComposer,
          $$GuestsTableOrderingComposer,
          $$GuestsTableAnnotationComposer,
          $$GuestsTableCreateCompanionBuilder,
          $$GuestsTableUpdateCompanionBuilder,
          (Guest, BaseReferences<_$AppDatabase, $GuestsTable, Guest>),
          Guest,
          PrefetchHooks Function()
        > {
  $$GuestsTableTableManager(_$AppDatabase db, $GuestsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> weddingId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> side = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> rsvpStatus = const Value.absent(),
                Value<String> foodPreference = const Value.absent(),
                Value<bool> invitationSent = const Value.absent(),
                Value<String> roomAllocation = const Value.absent(),
                Value<String> tableNumber = const Value.absent(),
                Value<String> giftReceived = const Value.absent(),
                Value<double> giftValue = const Value.absent(),
                Value<bool> thankYouSent = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GuestsCompanion(
                id: id,
                weddingId: weddingId,
                name: name,
                side: side,
                phone: phone,
                email: email,
                rsvpStatus: rsvpStatus,
                foodPreference: foodPreference,
                invitationSent: invitationSent,
                roomAllocation: roomAllocation,
                tableNumber: tableNumber,
                giftReceived: giftReceived,
                giftValue: giftValue,
                thankYouSent: thankYouSent,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String weddingId,
                required String name,
                required String side,
                Value<String> phone = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> rsvpStatus = const Value.absent(),
                Value<String> foodPreference = const Value.absent(),
                Value<bool> invitationSent = const Value.absent(),
                Value<String> roomAllocation = const Value.absent(),
                Value<String> tableNumber = const Value.absent(),
                Value<String> giftReceived = const Value.absent(),
                Value<double> giftValue = const Value.absent(),
                Value<bool> thankYouSent = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GuestsCompanion.insert(
                id: id,
                weddingId: weddingId,
                name: name,
                side: side,
                phone: phone,
                email: email,
                rsvpStatus: rsvpStatus,
                foodPreference: foodPreference,
                invitationSent: invitationSent,
                roomAllocation: roomAllocation,
                tableNumber: tableNumber,
                giftReceived: giftReceived,
                giftValue: giftValue,
                thankYouSent: thankYouSent,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GuestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GuestsTable,
      Guest,
      $$GuestsTableFilterComposer,
      $$GuestsTableOrderingComposer,
      $$GuestsTableAnnotationComposer,
      $$GuestsTableCreateCompanionBuilder,
      $$GuestsTableUpdateCompanionBuilder,
      (Guest, BaseReferences<_$AppDatabase, $GuestsTable, Guest>),
      Guest,
      PrefetchHooks Function()
    >;
typedef $$TimelineTasksTableCreateCompanionBuilder =
    TimelineTasksCompanion Function({
      required String id,
      required String weddingId,
      required String stage,
      required String title,
      Value<bool> isCompleted,
      Value<DateTime?> dueDate,
      Value<int> rowid,
    });
typedef $$TimelineTasksTableUpdateCompanionBuilder =
    TimelineTasksCompanion Function({
      Value<String> id,
      Value<String> weddingId,
      Value<String> stage,
      Value<String> title,
      Value<bool> isCompleted,
      Value<DateTime?> dueDate,
      Value<int> rowid,
    });

class $$TimelineTasksTableFilterComposer
    extends Composer<_$AppDatabase, $TimelineTasksTable> {
  $$TimelineTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stage => $composableBuilder(
    column: $table.stage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TimelineTasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TimelineTasksTable> {
  $$TimelineTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weddingId => $composableBuilder(
    column: $table.weddingId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stage => $composableBuilder(
    column: $table.stage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TimelineTasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimelineTasksTable> {
  $$TimelineTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get weddingId =>
      $composableBuilder(column: $table.weddingId, builder: (column) => column);

  GeneratedColumn<String> get stage =>
      $composableBuilder(column: $table.stage, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);
}

class $$TimelineTasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimelineTasksTable,
          TimelineTask,
          $$TimelineTasksTableFilterComposer,
          $$TimelineTasksTableOrderingComposer,
          $$TimelineTasksTableAnnotationComposer,
          $$TimelineTasksTableCreateCompanionBuilder,
          $$TimelineTasksTableUpdateCompanionBuilder,
          (
            TimelineTask,
            BaseReferences<_$AppDatabase, $TimelineTasksTable, TimelineTask>,
          ),
          TimelineTask,
          PrefetchHooks Function()
        > {
  $$TimelineTasksTableTableManager(_$AppDatabase db, $TimelineTasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimelineTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimelineTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimelineTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> weddingId = const Value.absent(),
                Value<String> stage = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimelineTasksCompanion(
                id: id,
                weddingId: weddingId,
                stage: stage,
                title: title,
                isCompleted: isCompleted,
                dueDate: dueDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String weddingId,
                required String stage,
                required String title,
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimelineTasksCompanion.insert(
                id: id,
                weddingId: weddingId,
                stage: stage,
                title: title,
                isCompleted: isCompleted,
                dueDate: dueDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TimelineTasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimelineTasksTable,
      TimelineTask,
      $$TimelineTasksTableFilterComposer,
      $$TimelineTasksTableOrderingComposer,
      $$TimelineTasksTableAnnotationComposer,
      $$TimelineTasksTableCreateCompanionBuilder,
      $$TimelineTasksTableUpdateCompanionBuilder,
      (
        TimelineTask,
        BaseReferences<_$AppDatabase, $TimelineTasksTable, TimelineTask>,
      ),
      TimelineTask,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WeddingsTableTableManager get weddings =>
      $$WeddingsTableTableManager(_db, _db.weddings);
  $$CeremoniesTableTableManager get ceremonies =>
      $$CeremoniesTableTableManager(_db, _db.ceremonies);
  $$BudgetItemsTableTableManager get budgetItems =>
      $$BudgetItemsTableTableManager(_db, _db.budgetItems);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$GuestsTableTableManager get guests =>
      $$GuestsTableTableManager(_db, _db.guests);
  $$TimelineTasksTableTableManager get timelineTasks =>
      $$TimelineTasksTableTableManager(_db, _db.timelineTasks);
}
