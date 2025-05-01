// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<PgDateTime> createdAt =
      GeneratedColumn<PgDateTime>('created_at', aliasedName, false,
          type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<PgDateTime> updatedAt =
      GeneratedColumn<PgDateTime>('updated_at', aliasedName, false,
          type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted =
      GeneratedColumn<bool>('is_deleted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_deleted" IN (0, 1))',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, email, createdAt, displayName, updatedAt, isDeleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      createdAt: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone, data['${effectivePrefix}created_at'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      updatedAt: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserEntity extends DataClass implements Insertable<UserEntity> {
  final String id;
  final String email;
  final PgDateTime createdAt;
  final String displayName;
  final PgDateTime updatedAt;
  final bool isDeleted;
  const UserEntity(
      {required this.id,
      required this.email,
      required this.createdAt,
      required this.displayName,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    map['created_at'] =
        Variable<PgDateTime>(createdAt, PgTypes.timestampWithTimezone);
    map['display_name'] = Variable<String>(displayName);
    map['updated_at'] =
        Variable<PgDateTime>(updatedAt, PgTypes.timestampWithTimezone);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      createdAt: Value(createdAt),
      displayName: Value(displayName),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntity(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      createdAt: serializer.fromJson<PgDateTime>(json['createdAt']),
      displayName: serializer.fromJson<String>(json['displayName']),
      updatedAt: serializer.fromJson<PgDateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'createdAt': serializer.toJson<PgDateTime>(createdAt),
      'displayName': serializer.toJson<String>(displayName),
      'updatedAt': serializer.toJson<PgDateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  UserEntity copyWith(
          {String? id,
          String? email,
          PgDateTime? createdAt,
          String? displayName,
          PgDateTime? updatedAt,
          bool? isDeleted}) =>
      UserEntity(
        id: id ?? this.id,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        displayName: displayName ?? this.displayName,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  UserEntity copyWithCompanion(UsersCompanion data) {
    return UserEntity(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntity(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('displayName: $displayName, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, email, createdAt, displayName, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          other.id == this.id &&
          other.email == this.email &&
          other.createdAt == this.createdAt &&
          other.displayName == this.displayName &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class UsersCompanion extends UpdateCompanion<UserEntity> {
  final Value<String> id;
  final Value<String> email;
  final Value<PgDateTime> createdAt;
  final Value<String> displayName;
  final Value<PgDateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.displayName = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String email,
    required PgDateTime createdAt,
    required String displayName,
    required PgDateTime updatedAt,
    required bool isDeleted,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        email = Value(email),
        createdAt = Value(createdAt),
        displayName = Value(displayName),
        updatedAt = Value(updatedAt),
        isDeleted = Value(isDeleted);
  static Insertable<UserEntity> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<PgDateTime>? createdAt,
    Expression<String>? displayName,
    Expression<PgDateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
      if (displayName != null) 'display_name': displayName,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? email,
      Value<PgDateTime>? createdAt,
      Value<String>? displayName,
      Value<PgDateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      displayName: displayName ?? this.displayName,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] =
          Variable<PgDateTime>(createdAt.value, PgTypes.timestampWithTimezone);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (updatedAt.present) {
      map['updated_at'] =
          Variable<PgDateTime>(updatedAt.value, PgTypes.timestampWithTimezone);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('displayName: $displayName, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DevicesTable extends Devices
    with TableInfo<$DevicesTable, DeviceEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (id) ON DELETE CASCADE'));
  static const VerificationMeta _lastSyncedMeta =
      const VerificationMeta('lastSynced');
  @override
  late final GeneratedColumn<PgDateTime> lastSynced =
      GeneratedColumn<PgDateTime>('last_synced', aliasedName, false,
          type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, lastSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(Insertable<DeviceEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('last_synced')) {
      context.handle(
          _lastSyncedMeta,
          lastSynced.isAcceptableOrUnknown(
              data['last_synced']!, _lastSyncedMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeviceEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      lastSynced: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone,
          data['${effectivePrefix}last_synced'])!,
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class DeviceEntity extends DataClass implements Insertable<DeviceEntity> {
  final String id;
  final String userId;
  final PgDateTime lastSynced;
  const DeviceEntity(
      {required this.id, required this.userId, required this.lastSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['last_synced'] =
        Variable<PgDateTime>(lastSynced, PgTypes.timestampWithTimezone);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      userId: Value(userId),
      lastSynced: Value(lastSynced),
    );
  }

  factory DeviceEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      lastSynced: serializer.fromJson<PgDateTime>(json['lastSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'lastSynced': serializer.toJson<PgDateTime>(lastSynced),
    };
  }

  DeviceEntity copyWith({String? id, String? userId, PgDateTime? lastSynced}) =>
      DeviceEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        lastSynced: lastSynced ?? this.lastSynced,
      );
  DeviceEntity copyWithCompanion(DevicesCompanion data) {
    return DeviceEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      lastSynced:
          data.lastSynced.present ? data.lastSynced.value : this.lastSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, lastSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.lastSynced == this.lastSynced);
}

class DevicesCompanion extends UpdateCompanion<DeviceEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<PgDateTime> lastSynced;
  final Value<int> rowid;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.lastSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DevicesCompanion.insert({
    required String id,
    required String userId,
    required PgDateTime lastSynced,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        lastSynced = Value(lastSynced);
  static Insertable<DeviceEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<PgDateTime>? lastSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (lastSynced != null) 'last_synced': lastSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DevicesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<PgDateTime>? lastSynced,
      Value<int>? rowid}) {
    return DevicesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      lastSynced: lastSynced ?? this.lastSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (lastSynced.present) {
      map['last_synced'] =
          Variable<PgDateTime>(lastSynced.value, PgTypes.timestampWithTimezone);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('lastSynced: $lastSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalCheckInsTable extends GoalCheckIns
    with TableInfo<$GoalCheckInsTable, GoalCheckInEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalCheckInsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (id) ON DELETE CASCADE'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<PgDateTime> date = GeneratedColumn<PgDateTime>(
      'date', aliasedName, false,
      type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Set<String>, String> goals =
      GeneratedColumn<String>('goals', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Set<String>>($GoalCheckInsTable.$convertergoals);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<PgDateTime> updatedAt =
      GeneratedColumn<PgDateTime>('updated_at', aliasedName, false,
          type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted =
      GeneratedColumn<bool>('is_deleted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_deleted" IN (0, 1))',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [userId, date, goals, updatedAt, isDeleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_check_ins';
  @override
  VerificationContext validateIntegrity(Insertable<GoalCheckInEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, date};
  @override
  GoalCheckInEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalCheckInEntity(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      date: attachedDatabase.typeMapping
          .read(PgTypes.timestampWithTimezone, data['${effectivePrefix}date'])!,
      goals: $GoalCheckInsTable.$convertergoals.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goals'])!),
      updatedAt: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $GoalCheckInsTable createAlias(String alias) {
    return $GoalCheckInsTable(attachedDatabase, alias);
  }

  static TypeConverter<Set<String>, String> $convertergoals =
      const StringSetConverter();
}

class GoalCheckInEntity extends DataClass
    implements Insertable<GoalCheckInEntity> {
  final String userId;
  final PgDateTime date;
  final Set<String> goals;
  final PgDateTime updatedAt;
  final bool isDeleted;
  const GoalCheckInEntity(
      {required this.userId,
      required this.date,
      required this.goals,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['date'] = Variable<PgDateTime>(date, PgTypes.timestampWithTimezone);
    {
      map['goals'] =
          Variable<String>($GoalCheckInsTable.$convertergoals.toSql(goals));
    }
    map['updated_at'] =
        Variable<PgDateTime>(updatedAt, PgTypes.timestampWithTimezone);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  GoalCheckInsCompanion toCompanion(bool nullToAbsent) {
    return GoalCheckInsCompanion(
      userId: Value(userId),
      date: Value(date),
      goals: Value(goals),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory GoalCheckInEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalCheckInEntity(
      userId: serializer.fromJson<String>(json['userId']),
      date: serializer.fromJson<PgDateTime>(json['date']),
      goals: serializer.fromJson<Set<String>>(json['goals']),
      updatedAt: serializer.fromJson<PgDateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'date': serializer.toJson<PgDateTime>(date),
      'goals': serializer.toJson<Set<String>>(goals),
      'updatedAt': serializer.toJson<PgDateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  GoalCheckInEntity copyWith(
          {String? userId,
          PgDateTime? date,
          Set<String>? goals,
          PgDateTime? updatedAt,
          bool? isDeleted}) =>
      GoalCheckInEntity(
        userId: userId ?? this.userId,
        date: date ?? this.date,
        goals: goals ?? this.goals,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  GoalCheckInEntity copyWithCompanion(GoalCheckInsCompanion data) {
    return GoalCheckInEntity(
      userId: data.userId.present ? data.userId.value : this.userId,
      date: data.date.present ? data.date.value : this.date,
      goals: data.goals.present ? data.goals.value : this.goals,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalCheckInEntity(')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('goals: $goals, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, date, goals, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalCheckInEntity &&
          other.userId == this.userId &&
          other.date == this.date &&
          other.goals == this.goals &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class GoalCheckInsCompanion extends UpdateCompanion<GoalCheckInEntity> {
  final Value<String> userId;
  final Value<PgDateTime> date;
  final Value<Set<String>> goals;
  final Value<PgDateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const GoalCheckInsCompanion({
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
    this.goals = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalCheckInsCompanion.insert({
    required String userId,
    required PgDateTime date,
    required Set<String> goals,
    required PgDateTime updatedAt,
    required bool isDeleted,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        date = Value(date),
        goals = Value(goals),
        updatedAt = Value(updatedAt),
        isDeleted = Value(isDeleted);
  static Insertable<GoalCheckInEntity> custom({
    Expression<String>? userId,
    Expression<PgDateTime>? date,
    Expression<String>? goals,
    Expression<PgDateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
      if (goals != null) 'goals': goals,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalCheckInsCompanion copyWith(
      {Value<String>? userId,
      Value<PgDateTime>? date,
      Value<Set<String>>? goals,
      Value<PgDateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return GoalCheckInsCompanion(
      userId: userId ?? this.userId,
      date: date ?? this.date,
      goals: goals ?? this.goals,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (date.present) {
      map['date'] =
          Variable<PgDateTime>(date.value, PgTypes.timestampWithTimezone);
    }
    if (goals.present) {
      map['goals'] = Variable<String>(
          $GoalCheckInsTable.$convertergoals.toSql(goals.value));
    }
    if (updatedAt.present) {
      map['updated_at'] =
          Variable<PgDateTime>(updatedAt.value, PgTypes.timestampWithTimezone);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalCheckInsCompanion(')
          ..write('userId: $userId, ')
          ..write('date: $date, ')
          ..write('goals: $goals, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, GoalEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<PgDateTime> createdAt =
      GeneratedColumn<PgDateTime>('created_at', aliasedName, false,
          type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      guideQuestions = GeneratedColumn<String>(
              'guide_questions', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<Map<String, String>>>(
              $GoalsTable.$converterguideQuestions);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      notificationSchedule = GeneratedColumn<String>(
              'notification_schedule', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $GoalsTable.$converternotificationSchedule);
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived =
      GeneratedColumn<bool>('is_archived', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_archived" IN (0, 1))',
            SqlDialect.postgres: '',
          }),
          clientDefault: () => false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<PgDateTime> updatedAt =
      GeneratedColumn<PgDateTime>('updated_at', aliasedName, false,
          type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted =
      GeneratedColumn<bool>('is_deleted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_deleted" IN (0, 1))',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        createdAt,
        title,
        type,
        guideQuestions,
        notificationSchedule,
        isArchived,
        updatedAt,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<GoalEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      createdAt: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone, data['${effectivePrefix}created_at'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      guideQuestions: $GoalsTable.$converterguideQuestions.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}guide_questions'])!),
      notificationSchedule: $GoalsTable.$converternotificationSchedule.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}notification_schedule'])!),
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      updatedAt: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<Map<String, String>>, String>
      $converterguideQuestions = const QuestionListConverter();
  static TypeConverter<List<String>, String> $converternotificationSchedule =
      const StringListConverter();
}

class GoalEntity extends DataClass implements Insertable<GoalEntity> {
  final String id;
  final String userId;
  final PgDateTime createdAt;
  final String title;
  final String type;
  final List<Map<String, String>> guideQuestions;
  final List<String> notificationSchedule;
  final bool isArchived;
  final PgDateTime updatedAt;
  final bool isDeleted;
  const GoalEntity(
      {required this.id,
      required this.userId,
      required this.createdAt,
      required this.title,
      required this.type,
      required this.guideQuestions,
      required this.notificationSchedule,
      required this.isArchived,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] =
        Variable<PgDateTime>(createdAt, PgTypes.timestampWithTimezone);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    {
      map['guide_questions'] = Variable<String>(
          $GoalsTable.$converterguideQuestions.toSql(guideQuestions));
    }
    {
      map['notification_schedule'] = Variable<String>($GoalsTable
          .$converternotificationSchedule
          .toSql(notificationSchedule));
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['updated_at'] =
        Variable<PgDateTime>(updatedAt, PgTypes.timestampWithTimezone);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      title: Value(title),
      type: Value(type),
      guideQuestions: Value(guideQuestions),
      notificationSchedule: Value(notificationSchedule),
      isArchived: Value(isArchived),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory GoalEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<PgDateTime>(json['createdAt']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      guideQuestions: serializer
          .fromJson<List<Map<String, String>>>(json['guideQuestions']),
      notificationSchedule:
          serializer.fromJson<List<String>>(json['notificationSchedule']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      updatedAt: serializer.fromJson<PgDateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<PgDateTime>(createdAt),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'guideQuestions':
          serializer.toJson<List<Map<String, String>>>(guideQuestions),
      'notificationSchedule':
          serializer.toJson<List<String>>(notificationSchedule),
      'isArchived': serializer.toJson<bool>(isArchived),
      'updatedAt': serializer.toJson<PgDateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  GoalEntity copyWith(
          {String? id,
          String? userId,
          PgDateTime? createdAt,
          String? title,
          String? type,
          List<Map<String, String>>? guideQuestions,
          List<String>? notificationSchedule,
          bool? isArchived,
          PgDateTime? updatedAt,
          bool? isDeleted}) =>
      GoalEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
        type: type ?? this.type,
        guideQuestions: guideQuestions ?? this.guideQuestions,
        notificationSchedule: notificationSchedule ?? this.notificationSchedule,
        isArchived: isArchived ?? this.isArchived,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  GoalEntity copyWithCompanion(GoalsCompanion data) {
    return GoalEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      guideQuestions: data.guideQuestions.present
          ? data.guideQuestions.value
          : this.guideQuestions,
      notificationSchedule: data.notificationSchedule.present
          ? data.notificationSchedule.value
          : this.notificationSchedule,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('guideQuestions: $guideQuestions, ')
          ..write('notificationSchedule: $notificationSchedule, ')
          ..write('isArchived: $isArchived, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, createdAt, title, type,
      guideQuestions, notificationSchedule, isArchived, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.title == this.title &&
          other.type == this.type &&
          other.guideQuestions == this.guideQuestions &&
          other.notificationSchedule == this.notificationSchedule &&
          other.isArchived == this.isArchived &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class GoalsCompanion extends UpdateCompanion<GoalEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<PgDateTime> createdAt;
  final Value<String> title;
  final Value<String> type;
  final Value<List<Map<String, String>>> guideQuestions;
  final Value<List<String>> notificationSchedule;
  final Value<bool> isArchived;
  final Value<PgDateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.guideQuestions = const Value.absent(),
    this.notificationSchedule = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    required String userId,
    required PgDateTime createdAt,
    required String title,
    required String type,
    required List<Map<String, String>> guideQuestions,
    required List<String> notificationSchedule,
    this.isArchived = const Value.absent(),
    required PgDateTime updatedAt,
    required bool isDeleted,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        createdAt = Value(createdAt),
        title = Value(title),
        type = Value(type),
        guideQuestions = Value(guideQuestions),
        notificationSchedule = Value(notificationSchedule),
        updatedAt = Value(updatedAt),
        isDeleted = Value(isDeleted);
  static Insertable<GoalEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<PgDateTime>? createdAt,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? guideQuestions,
    Expression<String>? notificationSchedule,
    Expression<bool>? isArchived,
    Expression<PgDateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (guideQuestions != null) 'guide_questions': guideQuestions,
      if (notificationSchedule != null)
        'notification_schedule': notificationSchedule,
      if (isArchived != null) 'is_archived': isArchived,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<PgDateTime>? createdAt,
      Value<String>? title,
      Value<String>? type,
      Value<List<Map<String, String>>>? guideQuestions,
      Value<List<String>>? notificationSchedule,
      Value<bool>? isArchived,
      Value<PgDateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return GoalsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      type: type ?? this.type,
      guideQuestions: guideQuestions ?? this.guideQuestions,
      notificationSchedule: notificationSchedule ?? this.notificationSchedule,
      isArchived: isArchived ?? this.isArchived,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] =
          Variable<PgDateTime>(createdAt.value, PgTypes.timestampWithTimezone);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (guideQuestions.present) {
      map['guide_questions'] = Variable<String>(
          $GoalsTable.$converterguideQuestions.toSql(guideQuestions.value));
    }
    if (notificationSchedule.present) {
      map['notification_schedule'] = Variable<String>($GoalsTable
          .$converternotificationSchedule
          .toSql(notificationSchedule.value));
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (updatedAt.present) {
      map['updated_at'] =
          Variable<PgDateTime>(updatedAt.value, PgTypes.timestampWithTimezone);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('guideQuestions: $guideQuestions, ')
          ..write('notificationSchedule: $notificationSchedule, ')
          ..write('isArchived: $isArchived, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<PgDateTime> createdAt =
      GeneratedColumn<PgDateTime>('created_at', aliasedName, false,
          type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  static const VerificationMeta _guidedJournalMeta =
      const VerificationMeta('guidedJournal');
  @override
  late final GeneratedColumn<String> guidedJournal = GeneratedColumn<String>(
      'guided_journal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      content = GeneratedColumn<String>('content', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<Map<String, String>>>(
              $JournalEntriesTable.$convertercontent);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<PgDateTime> updatedAt =
      GeneratedColumn<PgDateTime>('updated_at', aliasedName, false,
          type: PgTypes.timestampWithTimezone, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted =
      GeneratedColumn<bool>('is_deleted', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_deleted" IN (0, 1))',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        createdAt,
        guidedJournal,
        title,
        content,
        updatedAt,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(Insertable<JournalEntryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('guided_journal')) {
      context.handle(
          _guidedJournalMeta,
          guidedJournal.isAcceptableOrUnknown(
              data['guided_journal']!, _guidedJournalMeta));
    } else if (isInserting) {
      context.missing(_guidedJournalMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    } else if (isInserting) {
      context.missing(_isDeletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntryEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      createdAt: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone, data['${effectivePrefix}created_at'])!,
      guidedJournal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guided_journal'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: $JournalEntriesTable.$convertercontent.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!),
      updatedAt: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<Map<String, String>>, String> $convertercontent =
      const QuestionListConverter();
}

class JournalEntryEntity extends DataClass
    implements Insertable<JournalEntryEntity> {
  final String id;
  final String userId;
  final PgDateTime createdAt;
  final String guidedJournal;
  final String title;
  final List<Map<String, String>> content;
  final PgDateTime updatedAt;
  final bool isDeleted;
  const JournalEntryEntity(
      {required this.id,
      required this.userId,
      required this.createdAt,
      required this.guidedJournal,
      required this.title,
      required this.content,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] =
        Variable<PgDateTime>(createdAt, PgTypes.timestampWithTimezone);
    map['guided_journal'] = Variable<String>(guidedJournal);
    map['title'] = Variable<String>(title);
    {
      map['content'] = Variable<String>(
          $JournalEntriesTable.$convertercontent.toSql(content));
    }
    map['updated_at'] =
        Variable<PgDateTime>(updatedAt, PgTypes.timestampWithTimezone);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      guidedJournal: Value(guidedJournal),
      title: Value(title),
      content: Value(content),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory JournalEntryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntryEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<PgDateTime>(json['createdAt']),
      guidedJournal: serializer.fromJson<String>(json['guidedJournal']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<List<Map<String, String>>>(json['content']),
      updatedAt: serializer.fromJson<PgDateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<PgDateTime>(createdAt),
      'guidedJournal': serializer.toJson<String>(guidedJournal),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<List<Map<String, String>>>(content),
      'updatedAt': serializer.toJson<PgDateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  JournalEntryEntity copyWith(
          {String? id,
          String? userId,
          PgDateTime? createdAt,
          String? guidedJournal,
          String? title,
          List<Map<String, String>>? content,
          PgDateTime? updatedAt,
          bool? isDeleted}) =>
      JournalEntryEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        guidedJournal: guidedJournal ?? this.guidedJournal,
        title: title ?? this.title,
        content: content ?? this.content,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  JournalEntryEntity copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntryEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      guidedJournal: data.guidedJournal.present
          ? data.guidedJournal.value
          : this.guidedJournal,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntryEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('guidedJournal: $guidedJournal, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, createdAt, guidedJournal, title,
      content, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntryEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.guidedJournal == this.guidedJournal &&
          other.title == this.title &&
          other.content == this.content &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntryEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<PgDateTime> createdAt;
  final Value<String> guidedJournal;
  final Value<String> title;
  final Value<List<Map<String, String>>> content;
  final Value<PgDateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.guidedJournal = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    required String id,
    required String userId,
    required PgDateTime createdAt,
    required String guidedJournal,
    required String title,
    required List<Map<String, String>> content,
    required PgDateTime updatedAt,
    required bool isDeleted,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        createdAt = Value(createdAt),
        guidedJournal = Value(guidedJournal),
        title = Value(title),
        content = Value(content),
        updatedAt = Value(updatedAt),
        isDeleted = Value(isDeleted);
  static Insertable<JournalEntryEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<PgDateTime>? createdAt,
    Expression<String>? guidedJournal,
    Expression<String>? title,
    Expression<String>? content,
    Expression<PgDateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (guidedJournal != null) 'guided_journal': guidedJournal,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalEntriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<PgDateTime>? createdAt,
      Value<String>? guidedJournal,
      Value<String>? title,
      Value<List<Map<String, String>>>? content,
      Value<PgDateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      guidedJournal: guidedJournal ?? this.guidedJournal,
      title: title ?? this.title,
      content: content ?? this.content,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] =
          Variable<PgDateTime>(createdAt.value, PgTypes.timestampWithTimezone);
    }
    if (guidedJournal.present) {
      map['guided_journal'] = Variable<String>(guidedJournal.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(
          $JournalEntriesTable.$convertercontent.toSql(content.value));
    }
    if (updatedAt.present) {
      map['updated_at'] =
          Variable<PgDateTime>(updatedAt.value, PgTypes.timestampWithTimezone);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('guidedJournal: $guidedJournal, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $GoalCheckInsTable goalCheckIns = $GoalCheckInsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, devices, goalCheckIns, goals, journalEntries];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('devices', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('goal_check_ins', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('goals', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('journal_entries', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String email,
  required PgDateTime createdAt,
  required String displayName,
  required PgDateTime updatedAt,
  required bool isDeleted,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> email,
  Value<PgDateTime> createdAt,
  Value<String> displayName,
  Value<PgDateTime> updatedAt,
  Value<bool> isDeleted,
  Value<int> rowid,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, UserEntity> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DevicesTable, List<DeviceEntity>>
      _devicesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.devices,
              aliasName: $_aliasNameGenerator(db.users.id, db.devices.userId));

  $$DevicesTableProcessedTableManager get devicesRefs {
    final manager = $$DevicesTableTableManager($_db, $_db.devices)
        .filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_devicesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$GoalCheckInsTable, List<GoalCheckInEntity>>
      _goalCheckInsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.goalCheckIns,
          aliasName: $_aliasNameGenerator(db.users.id, db.goalCheckIns.userId));

  $$GoalCheckInsTableProcessedTableManager get goalCheckInsRefs {
    final manager = $$GoalCheckInsTableTableManager($_db, $_db.goalCheckIns)
        .filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalCheckInsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$GoalsTable, List<GoalEntity>> _goalsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.goals,
          aliasName: $_aliasNameGenerator(db.users.id, db.goals.userId));

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager($_db, $_db.goals)
        .filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$JournalEntriesTable, List<JournalEntryEntity>>
      _journalEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.journalEntries,
              aliasName:
                  $_aliasNameGenerator(db.users.id, db.journalEntries.userId));

  $$JournalEntriesTableProcessedTableManager get journalEntriesRefs {
    final manager = $$JournalEntriesTableTableManager($_db, $_db.journalEntries)
        .filter((f) => f.userId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_journalEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  Expression<bool> devicesRefs(
      Expression<bool> Function($$DevicesTableFilterComposer f) f) {
    final $$DevicesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableFilterComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> goalCheckInsRefs(
      Expression<bool> Function($$GoalCheckInsTableFilterComposer f) f) {
    final $$GoalCheckInsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.goalCheckIns,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalCheckInsTableFilterComposer(
              $db: $db,
              $table: $db.goalCheckIns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> goalsRefs(
      Expression<bool> Function($$GoalsTableFilterComposer f) f) {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalsTableFilterComposer(
              $db: $db,
              $table: $db.goals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> journalEntriesRefs(
      Expression<bool> Function($$JournalEntriesTableFilterComposer f) f) {
    final $$JournalEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.journalEntries,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JournalEntriesTableFilterComposer(
              $db: $db,
              $table: $db.journalEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<PgDateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<PgDateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> devicesRefs<T extends Object>(
      Expression<T> Function($$DevicesTableAnnotationComposer a) f) {
    final $$DevicesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableAnnotationComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> goalCheckInsRefs<T extends Object>(
      Expression<T> Function($$GoalCheckInsTableAnnotationComposer a) f) {
    final $$GoalCheckInsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.goalCheckIns,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalCheckInsTableAnnotationComposer(
              $db: $db,
              $table: $db.goalCheckIns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> goalsRefs<T extends Object>(
      Expression<T> Function($$GoalsTableAnnotationComposer a) f) {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalsTableAnnotationComposer(
              $db: $db,
              $table: $db.goals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> journalEntriesRefs<T extends Object>(
      Expression<T> Function($$JournalEntriesTableAnnotationComposer a) f) {
    final $$JournalEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.journalEntries,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JournalEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.journalEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    UserEntity,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserEntity, $$UsersTableReferences),
    UserEntity,
    PrefetchHooks Function(
        {bool devicesRefs,
        bool goalCheckInsRefs,
        bool goalsRefs,
        bool journalEntriesRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<PgDateTime> createdAt = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<PgDateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            email: email,
            createdAt: createdAt,
            displayName: displayName,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String email,
            required PgDateTime createdAt,
            required String displayName,
            required PgDateTime updatedAt,
            required bool isDeleted,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            email: email,
            createdAt: createdAt,
            displayName: displayName,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {devicesRefs = false,
              goalCheckInsRefs = false,
              goalsRefs = false,
              journalEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (devicesRefs) db.devices,
                if (goalCheckInsRefs) db.goalCheckIns,
                if (goalsRefs) db.goals,
                if (journalEntriesRefs) db.journalEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (devicesRefs)
                    await $_getPrefetchedData<UserEntity, $UsersTable,
                            DeviceEntity>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._devicesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).devicesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items),
                  if (goalCheckInsRefs)
                    await $_getPrefetchedData<UserEntity, $UsersTable,
                            GoalCheckInEntity>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._goalCheckInsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .goalCheckInsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items),
                  if (goalsRefs)
                    await $_getPrefetchedData<UserEntity, $UsersTable,
                            GoalEntity>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._goalsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).goalsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items),
                  if (journalEntriesRefs)
                    await $_getPrefetchedData<UserEntity, $UsersTable,
                            JournalEntryEntity>(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._journalEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .journalEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    UserEntity,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserEntity, $$UsersTableReferences),
    UserEntity,
    PrefetchHooks Function(
        {bool devicesRefs,
        bool goalCheckInsRefs,
        bool goalsRefs,
        bool journalEntriesRefs})>;
typedef $$DevicesTableCreateCompanionBuilder = DevicesCompanion Function({
  required String id,
  required String userId,
  required PgDateTime lastSynced,
  Value<int> rowid,
});
typedef $$DevicesTableUpdateCompanionBuilder = DevicesCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<PgDateTime> lastSynced,
  Value<int> rowid,
});

final class $$DevicesTableReferences
    extends BaseReferences<_$AppDatabase, $DevicesTable, DeviceEntity> {
  $$DevicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.devices.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DevicesTableFilterComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<PgDateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<PgDateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DevicesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DevicesTable,
    DeviceEntity,
    $$DevicesTableFilterComposer,
    $$DevicesTableOrderingComposer,
    $$DevicesTableAnnotationComposer,
    $$DevicesTableCreateCompanionBuilder,
    $$DevicesTableUpdateCompanionBuilder,
    (DeviceEntity, $$DevicesTableReferences),
    DeviceEntity,
    PrefetchHooks Function({bool userId})> {
  $$DevicesTableTableManager(_$AppDatabase db, $DevicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<PgDateTime> lastSynced = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DevicesCompanion(
            id: id,
            userId: userId,
            lastSynced: lastSynced,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required PgDateTime lastSynced,
            Value<int> rowid = const Value.absent(),
          }) =>
              DevicesCompanion.insert(
            id: id,
            userId: userId,
            lastSynced: lastSynced,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DevicesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $$DevicesTableReferences._userIdTable(db),
                    referencedColumn:
                        $$DevicesTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DevicesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DevicesTable,
    DeviceEntity,
    $$DevicesTableFilterComposer,
    $$DevicesTableOrderingComposer,
    $$DevicesTableAnnotationComposer,
    $$DevicesTableCreateCompanionBuilder,
    $$DevicesTableUpdateCompanionBuilder,
    (DeviceEntity, $$DevicesTableReferences),
    DeviceEntity,
    PrefetchHooks Function({bool userId})>;
typedef $$GoalCheckInsTableCreateCompanionBuilder = GoalCheckInsCompanion
    Function({
  required String userId,
  required PgDateTime date,
  required Set<String> goals,
  required PgDateTime updatedAt,
  required bool isDeleted,
  Value<int> rowid,
});
typedef $$GoalCheckInsTableUpdateCompanionBuilder = GoalCheckInsCompanion
    Function({
  Value<String> userId,
  Value<PgDateTime> date,
  Value<Set<String>> goals,
  Value<PgDateTime> updatedAt,
  Value<bool> isDeleted,
  Value<int> rowid,
});

final class $$GoalCheckInsTableReferences extends BaseReferences<_$AppDatabase,
    $GoalCheckInsTable, GoalCheckInEntity> {
  $$GoalCheckInsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.goalCheckIns.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GoalCheckInsTableFilterComposer
    extends Composer<_$AppDatabase, $GoalCheckInsTable> {
  $$GoalCheckInsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<PgDateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Set<String>, Set<String>, String> get goals =>
      $composableBuilder(
          column: $table.goals,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GoalCheckInsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalCheckInsTable> {
  $$GoalCheckInsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<PgDateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goals => $composableBuilder(
      column: $table.goals, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GoalCheckInsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalCheckInsTable> {
  $$GoalCheckInsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<PgDateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Set<String>, String> get goals =>
      $composableBuilder(column: $table.goals, builder: (column) => column);

  GeneratedColumn<PgDateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GoalCheckInsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalCheckInsTable,
    GoalCheckInEntity,
    $$GoalCheckInsTableFilterComposer,
    $$GoalCheckInsTableOrderingComposer,
    $$GoalCheckInsTableAnnotationComposer,
    $$GoalCheckInsTableCreateCompanionBuilder,
    $$GoalCheckInsTableUpdateCompanionBuilder,
    (GoalCheckInEntity, $$GoalCheckInsTableReferences),
    GoalCheckInEntity,
    PrefetchHooks Function({bool userId})> {
  $$GoalCheckInsTableTableManager(_$AppDatabase db, $GoalCheckInsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalCheckInsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalCheckInsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalCheckInsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<PgDateTime> date = const Value.absent(),
            Value<Set<String>> goals = const Value.absent(),
            Value<PgDateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalCheckInsCompanion(
            userId: userId,
            date: date,
            goals: goals,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required PgDateTime date,
            required Set<String> goals,
            required PgDateTime updatedAt,
            required bool isDeleted,
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalCheckInsCompanion.insert(
            userId: userId,
            date: date,
            goals: goals,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GoalCheckInsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$GoalCheckInsTableReferences._userIdTable(db),
                    referencedColumn:
                        $$GoalCheckInsTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$GoalCheckInsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalCheckInsTable,
    GoalCheckInEntity,
    $$GoalCheckInsTableFilterComposer,
    $$GoalCheckInsTableOrderingComposer,
    $$GoalCheckInsTableAnnotationComposer,
    $$GoalCheckInsTableCreateCompanionBuilder,
    $$GoalCheckInsTableUpdateCompanionBuilder,
    (GoalCheckInEntity, $$GoalCheckInsTableReferences),
    GoalCheckInEntity,
    PrefetchHooks Function({bool userId})>;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  required String id,
  required String userId,
  required PgDateTime createdAt,
  required String title,
  required String type,
  required List<Map<String, String>> guideQuestions,
  required List<String> notificationSchedule,
  Value<bool> isArchived,
  required PgDateTime updatedAt,
  required bool isDeleted,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<PgDateTime> createdAt,
  Value<String> title,
  Value<String> type,
  Value<List<Map<String, String>>> guideQuestions,
  Value<List<String>> notificationSchedule,
  Value<bool> isArchived,
  Value<PgDateTime> updatedAt,
  Value<bool> isDeleted,
  Value<int> rowid,
});

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, GoalEntity> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.goals.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<Map<String, String>>,
          List<Map<String, String>>, String>
      get guideQuestions => $composableBuilder(
          column: $table.guideQuestions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get notificationSchedule => $composableBuilder(
          column: $table.notificationSchedule,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guideQuestions => $composableBuilder(
      column: $table.guideQuestions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notificationSchedule => $composableBuilder(
      column: $table.notificationSchedule,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<PgDateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      get guideQuestions => $composableBuilder(
          column: $table.guideQuestions, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get notificationSchedule => $composableBuilder(
          column: $table.notificationSchedule, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<PgDateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalsTable,
    GoalEntity,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (GoalEntity, $$GoalsTableReferences),
    GoalEntity,
    PrefetchHooks Function({bool userId})> {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<PgDateTime> createdAt = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<List<Map<String, String>>> guideQuestions =
                const Value.absent(),
            Value<List<String>> notificationSchedule = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<PgDateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion(
            id: id,
            userId: userId,
            createdAt: createdAt,
            title: title,
            type: type,
            guideQuestions: guideQuestions,
            notificationSchedule: notificationSchedule,
            isArchived: isArchived,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required PgDateTime createdAt,
            required String title,
            required String type,
            required List<Map<String, String>> guideQuestions,
            required List<String> notificationSchedule,
            Value<bool> isArchived = const Value.absent(),
            required PgDateTime updatedAt,
            required bool isDeleted,
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion.insert(
            id: id,
            userId: userId,
            createdAt: createdAt,
            title: title,
            type: type,
            guideQuestions: guideQuestions,
            notificationSchedule: notificationSchedule,
            isArchived: isArchived,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GoalsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $$GoalsTableReferences._userIdTable(db),
                    referencedColumn:
                        $$GoalsTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$GoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalsTable,
    GoalEntity,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (GoalEntity, $$GoalsTableReferences),
    GoalEntity,
    PrefetchHooks Function({bool userId})>;
typedef $$JournalEntriesTableCreateCompanionBuilder = JournalEntriesCompanion
    Function({
  required String id,
  required String userId,
  required PgDateTime createdAt,
  required String guidedJournal,
  required String title,
  required List<Map<String, String>> content,
  required PgDateTime updatedAt,
  required bool isDeleted,
  Value<int> rowid,
});
typedef $$JournalEntriesTableUpdateCompanionBuilder = JournalEntriesCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<PgDateTime> createdAt,
  Value<String> guidedJournal,
  Value<String> title,
  Value<List<Map<String, String>>> content,
  Value<PgDateTime> updatedAt,
  Value<bool> isDeleted,
  Value<int> rowid,
});

final class $$JournalEntriesTableReferences extends BaseReferences<
    _$AppDatabase, $JournalEntriesTable, JournalEntryEntity> {
  $$JournalEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.journalEntries.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guidedJournal => $composableBuilder(
      column: $table.guidedJournal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<Map<String, String>>,
          List<Map<String, String>>, String>
      get content => $composableBuilder(
          column: $table.content,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guidedJournal => $composableBuilder(
      column: $table.guidedJournal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<PgDateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get guidedJournal => $composableBuilder(
      column: $table.guidedJournal, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      get content => $composableBuilder(
          column: $table.content, builder: (column) => column);

  GeneratedColumn<PgDateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JournalEntriesTable,
    JournalEntryEntity,
    $$JournalEntriesTableFilterComposer,
    $$JournalEntriesTableOrderingComposer,
    $$JournalEntriesTableAnnotationComposer,
    $$JournalEntriesTableCreateCompanionBuilder,
    $$JournalEntriesTableUpdateCompanionBuilder,
    (JournalEntryEntity, $$JournalEntriesTableReferences),
    JournalEntryEntity,
    PrefetchHooks Function({bool userId})> {
  $$JournalEntriesTableTableManager(
      _$AppDatabase db, $JournalEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<PgDateTime> createdAt = const Value.absent(),
            Value<String> guidedJournal = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<List<Map<String, String>>> content = const Value.absent(),
            Value<PgDateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalEntriesCompanion(
            id: id,
            userId: userId,
            createdAt: createdAt,
            guidedJournal: guidedJournal,
            title: title,
            content: content,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required PgDateTime createdAt,
            required String guidedJournal,
            required String title,
            required List<Map<String, String>> content,
            required PgDateTime updatedAt,
            required bool isDeleted,
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalEntriesCompanion.insert(
            id: id,
            userId: userId,
            createdAt: createdAt,
            guidedJournal: guidedJournal,
            title: title,
            content: content,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JournalEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$JournalEntriesTableReferences._userIdTable(db),
                    referencedColumn:
                        $$JournalEntriesTableReferences._userIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$JournalEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JournalEntriesTable,
    JournalEntryEntity,
    $$JournalEntriesTableFilterComposer,
    $$JournalEntriesTableOrderingComposer,
    $$JournalEntriesTableAnnotationComposer,
    $$JournalEntriesTableCreateCompanionBuilder,
    $$JournalEntriesTableUpdateCompanionBuilder,
    (JournalEntryEntity, $$JournalEntriesTableReferences),
    JournalEntryEntity,
    PrefetchHooks Function({bool userId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$GoalCheckInsTableTableManager get goalCheckIns =>
      $$GoalCheckInsTableTableManager(_db, _db.goalCheckIns);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
}
