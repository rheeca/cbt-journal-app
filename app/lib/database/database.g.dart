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
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, email, createdAt, displayName];
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
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
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
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
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
  final DateTime createdAt;
  final String displayName;
  const UserEntity(
      {required this.id,
      required this.email,
      required this.createdAt,
      required this.displayName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['display_name'] = Variable<String>(displayName);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      createdAt: Value(createdAt),
      displayName: Value(displayName),
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntity(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      displayName: serializer.fromJson<String>(json['displayName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'displayName': serializer.toJson<String>(displayName),
    };
  }

  UserEntity copyWith(
          {String? id,
          String? email,
          DateTime? createdAt,
          String? displayName}) =>
      UserEntity(
        id: id ?? this.id,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        displayName: displayName ?? this.displayName,
      );
  UserEntity copyWithCompanion(UsersCompanion data) {
    return UserEntity(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntity(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('displayName: $displayName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, createdAt, displayName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          other.id == this.id &&
          other.email == this.email &&
          other.createdAt == this.createdAt &&
          other.displayName == this.displayName);
}

class UsersCompanion extends UpdateCompanion<UserEntity> {
  final Value<String> id;
  final Value<String> email;
  final Value<DateTime> createdAt;
  final Value<String> displayName;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.displayName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String email,
    this.createdAt = const Value.absent(),
    required String displayName,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        email = Value(email),
        displayName = Value(displayName);
  static Insertable<UserEntity> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<DateTime>? createdAt,
    Expression<String>? displayName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
      if (displayName != null) 'display_name': displayName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? email,
      Value<DateTime>? createdAt,
      Value<String>? displayName,
      Value<int>? rowid}) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      displayName: displayName ?? this.displayName,
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
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
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
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GuidedJournalsTable extends GuidedJournals
    with TableInfo<$GuidedJournalsTable, GuidedJournalEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuidedJournalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _guideQuestionsMeta =
      const VerificationMeta('guideQuestions');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      guideQuestions = GeneratedColumn<String>(
              'guide_questions', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $GuidedJournalsTable.$converterguideQuestions);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _journalTypeMeta =
      const VerificationMeta('journalType');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      journalType = GeneratedColumn<String>('journal_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $GuidedJournalsTable.$converterjournalType);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, guideQuestions, description, journalType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guided_journals';
  @override
  VerificationContext validateIntegrity(
      Insertable<GuidedJournalEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_guideQuestionsMeta, const VerificationResult.success());
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_journalTypeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GuidedJournalEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuidedJournalEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      guideQuestions: $GuidedJournalsTable.$converterguideQuestions.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}guide_questions'])!),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      journalType: $GuidedJournalsTable.$converterjournalType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}journal_type'])!),
    );
  }

  @override
  $GuidedJournalsTable createAlias(String alias) {
    return $GuidedJournalsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterguideQuestions =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterjournalType =
      const StringListConverter();
}

class GuidedJournalEntity extends DataClass
    implements Insertable<GuidedJournalEntity> {
  final String id;
  final String title;
  final List<String> guideQuestions;
  final String description;
  final List<String> journalType;
  const GuidedJournalEntity(
      {required this.id,
      required this.title,
      required this.guideQuestions,
      required this.description,
      required this.journalType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    {
      map['guide_questions'] = Variable<String>(
          $GuidedJournalsTable.$converterguideQuestions.toSql(guideQuestions));
    }
    map['description'] = Variable<String>(description);
    {
      map['journal_type'] = Variable<String>(
          $GuidedJournalsTable.$converterjournalType.toSql(journalType));
    }
    return map;
  }

  GuidedJournalsCompanion toCompanion(bool nullToAbsent) {
    return GuidedJournalsCompanion(
      id: Value(id),
      title: Value(title),
      guideQuestions: Value(guideQuestions),
      description: Value(description),
      journalType: Value(journalType),
    );
  }

  factory GuidedJournalEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuidedJournalEntity(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      guideQuestions: serializer.fromJson<List<String>>(json['guideQuestions']),
      description: serializer.fromJson<String>(json['description']),
      journalType: serializer.fromJson<List<String>>(json['journalType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'guideQuestions': serializer.toJson<List<String>>(guideQuestions),
      'description': serializer.toJson<String>(description),
      'journalType': serializer.toJson<List<String>>(journalType),
    };
  }

  GuidedJournalEntity copyWith(
          {String? id,
          String? title,
          List<String>? guideQuestions,
          String? description,
          List<String>? journalType}) =>
      GuidedJournalEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        guideQuestions: guideQuestions ?? this.guideQuestions,
        description: description ?? this.description,
        journalType: journalType ?? this.journalType,
      );
  GuidedJournalEntity copyWithCompanion(GuidedJournalsCompanion data) {
    return GuidedJournalEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      guideQuestions: data.guideQuestions.present
          ? data.guideQuestions.value
          : this.guideQuestions,
      description:
          data.description.present ? data.description.value : this.description,
      journalType:
          data.journalType.present ? data.journalType.value : this.journalType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuidedJournalEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('guideQuestions: $guideQuestions, ')
          ..write('description: $description, ')
          ..write('journalType: $journalType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, guideQuestions, description, journalType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuidedJournalEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.guideQuestions == this.guideQuestions &&
          other.description == this.description &&
          other.journalType == this.journalType);
}

class GuidedJournalsCompanion extends UpdateCompanion<GuidedJournalEntity> {
  final Value<String> id;
  final Value<String> title;
  final Value<List<String>> guideQuestions;
  final Value<String> description;
  final Value<List<String>> journalType;
  final Value<int> rowid;
  const GuidedJournalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.guideQuestions = const Value.absent(),
    this.description = const Value.absent(),
    this.journalType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GuidedJournalsCompanion.insert({
    required String id,
    required String title,
    required List<String> guideQuestions,
    required String description,
    required List<String> journalType,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        guideQuestions = Value(guideQuestions),
        description = Value(description),
        journalType = Value(journalType);
  static Insertable<GuidedJournalEntity> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? guideQuestions,
    Expression<String>? description,
    Expression<String>? journalType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (guideQuestions != null) 'guide_questions': guideQuestions,
      if (description != null) 'description': description,
      if (journalType != null) 'journal_type': journalType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GuidedJournalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<List<String>>? guideQuestions,
      Value<String>? description,
      Value<List<String>>? journalType,
      Value<int>? rowid}) {
    return GuidedJournalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      guideQuestions: guideQuestions ?? this.guideQuestions,
      description: description ?? this.description,
      journalType: journalType ?? this.journalType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (guideQuestions.present) {
      map['guide_questions'] = Variable<String>($GuidedJournalsTable
          .$converterguideQuestions
          .toSql(guideQuestions.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (journalType.present) {
      map['journal_type'] = Variable<String>(
          $GuidedJournalsTable.$converterjournalType.toSql(journalType.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuidedJournalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('guideQuestions: $guideQuestions, ')
          ..write('description: $description, ')
          ..write('journalType: $journalType, ')
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _guidedJournalMeta =
      const VerificationMeta('guidedJournal');
  @override
  late final GeneratedColumn<String> guidedJournal = GeneratedColumn<String>(
      'guided_journal', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES guided_journals (id)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      content = GeneratedColumn<String>('content', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<Map<String, String>>>(
              $JournalEntriesTable.$convertercontent);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, createdAt, guidedJournal, title, content];
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
    }
    context.handle(_contentMeta, const VerificationResult.success());
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
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      guidedJournal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guided_journal'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      content: $JournalEntriesTable.$convertercontent.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!),
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
  final DateTime createdAt;
  final String guidedJournal;
  final String? title;
  final List<Map<String, String>> content;
  const JournalEntryEntity(
      {required this.id,
      required this.userId,
      required this.createdAt,
      required this.guidedJournal,
      this.title,
      required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['guided_journal'] = Variable<String>(guidedJournal);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    {
      map['content'] = Variable<String>(
          $JournalEntriesTable.$convertercontent.toSql(content));
    }
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      guidedJournal: Value(guidedJournal),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: Value(content),
    );
  }

  factory JournalEntryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntryEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      guidedJournal: serializer.fromJson<String>(json['guidedJournal']),
      title: serializer.fromJson<String?>(json['title']),
      content: serializer.fromJson<List<Map<String, String>>>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'guidedJournal': serializer.toJson<String>(guidedJournal),
      'title': serializer.toJson<String?>(title),
      'content': serializer.toJson<List<Map<String, String>>>(content),
    };
  }

  JournalEntryEntity copyWith(
          {String? id,
          String? userId,
          DateTime? createdAt,
          String? guidedJournal,
          Value<String?> title = const Value.absent(),
          List<Map<String, String>>? content}) =>
      JournalEntryEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        guidedJournal: guidedJournal ?? this.guidedJournal,
        title: title.present ? title.value : this.title,
        content: content ?? this.content,
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
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, createdAt, guidedJournal, title, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntryEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.guidedJournal == this.guidedJournal &&
          other.title == this.title &&
          other.content == this.content);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntryEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<String> guidedJournal;
  final Value<String?> title;
  final Value<List<Map<String, String>>> content;
  final Value<int> rowid;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.guidedJournal = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    required String id,
    required String userId,
    this.createdAt = const Value.absent(),
    required String guidedJournal,
    this.title = const Value.absent(),
    required List<Map<String, String>> content,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        guidedJournal = Value(guidedJournal),
        content = Value(content);
  static Insertable<JournalEntryEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<String>? guidedJournal,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (guidedJournal != null) 'guided_journal': guidedJournal,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalEntriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<DateTime>? createdAt,
      Value<String>? guidedJournal,
      Value<String?>? title,
      Value<List<Map<String, String>>>? content,
      Value<int>? rowid}) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      guidedJournal: guidedJournal ?? this.guidedJournal,
      title: title ?? this.title,
      content: content ?? this.content,
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
      map['created_at'] = Variable<DateTime>(createdAt.value);
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
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _guideQuestionsMeta =
      const VerificationMeta('guideQuestions');
  @override
  late final GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      guideQuestions = GeneratedColumn<String>(
              'guide_questions', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<Map<String, String>>>(
              $GoalsTable.$converterguideQuestions);
  static const VerificationMeta _notificationScheduleMeta =
      const VerificationMeta('notificationSchedule');
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
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      clientDefault: () => false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        createdAt,
        title,
        guideQuestions,
        notificationSchedule,
        isArchived
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
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_guideQuestionsMeta, const VerificationResult.success());
    context.handle(
        _notificationScheduleMeta, const VerificationResult.success());
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
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
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      guideQuestions: $GoalsTable.$converterguideQuestions.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}guide_questions'])!),
      notificationSchedule: $GoalsTable.$converternotificationSchedule.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}notification_schedule'])!),
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
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
  final DateTime createdAt;
  final String title;
  final List<Map<String, String>> guideQuestions;
  final List<String> notificationSchedule;
  final bool isArchived;
  const GoalEntity(
      {required this.id,
      required this.userId,
      required this.createdAt,
      required this.title,
      required this.guideQuestions,
      required this.notificationSchedule,
      required this.isArchived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['title'] = Variable<String>(title);
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
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: Value(createdAt),
      title: Value(title),
      guideQuestions: Value(guideQuestions),
      notificationSchedule: Value(notificationSchedule),
      isArchived: Value(isArchived),
    );
  }

  factory GoalEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      title: serializer.fromJson<String>(json['title']),
      guideQuestions: serializer
          .fromJson<List<Map<String, String>>>(json['guideQuestions']),
      notificationSchedule:
          serializer.fromJson<List<String>>(json['notificationSchedule']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'title': serializer.toJson<String>(title),
      'guideQuestions':
          serializer.toJson<List<Map<String, String>>>(guideQuestions),
      'notificationSchedule':
          serializer.toJson<List<String>>(notificationSchedule),
      'isArchived': serializer.toJson<bool>(isArchived),
    };
  }

  GoalEntity copyWith(
          {String? id,
          String? userId,
          DateTime? createdAt,
          String? title,
          List<Map<String, String>>? guideQuestions,
          List<String>? notificationSchedule,
          bool? isArchived}) =>
      GoalEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        title: title ?? this.title,
        guideQuestions: guideQuestions ?? this.guideQuestions,
        notificationSchedule: notificationSchedule ?? this.notificationSchedule,
        isArchived: isArchived ?? this.isArchived,
      );
  GoalEntity copyWithCompanion(GoalsCompanion data) {
    return GoalEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      title: data.title.present ? data.title.value : this.title,
      guideQuestions: data.guideQuestions.present
          ? data.guideQuestions.value
          : this.guideQuestions,
      notificationSchedule: data.notificationSchedule.present
          ? data.notificationSchedule.value
          : this.notificationSchedule,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('title: $title, ')
          ..write('guideQuestions: $guideQuestions, ')
          ..write('notificationSchedule: $notificationSchedule, ')
          ..write('isArchived: $isArchived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, createdAt, title, guideQuestions,
      notificationSchedule, isArchived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.title == this.title &&
          other.guideQuestions == this.guideQuestions &&
          other.notificationSchedule == this.notificationSchedule &&
          other.isArchived == this.isArchived);
}

class GoalsCompanion extends UpdateCompanion<GoalEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime> createdAt;
  final Value<String> title;
  final Value<List<Map<String, String>>> guideQuestions;
  final Value<List<String>> notificationSchedule;
  final Value<bool> isArchived;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.title = const Value.absent(),
    this.guideQuestions = const Value.absent(),
    this.notificationSchedule = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    required String userId,
    this.createdAt = const Value.absent(),
    required String title,
    required List<Map<String, String>> guideQuestions,
    required List<String> notificationSchedule,
    this.isArchived = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        title = Value(title),
        guideQuestions = Value(guideQuestions),
        notificationSchedule = Value(notificationSchedule);
  static Insertable<GoalEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<String>? title,
    Expression<String>? guideQuestions,
    Expression<String>? notificationSchedule,
    Expression<bool>? isArchived,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (title != null) 'title': title,
      if (guideQuestions != null) 'guide_questions': guideQuestions,
      if (notificationSchedule != null)
        'notification_schedule': notificationSchedule,
      if (isArchived != null) 'is_archived': isArchived,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<DateTime>? createdAt,
      Value<String>? title,
      Value<List<Map<String, String>>>? guideQuestions,
      Value<List<String>>? notificationSchedule,
      Value<bool>? isArchived,
      Value<int>? rowid}) {
    return GoalsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      guideQuestions: guideQuestions ?? this.guideQuestions,
      notificationSchedule: notificationSchedule ?? this.notificationSchedule,
      isArchived: isArchived ?? this.isArchived,
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
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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
          ..write('guideQuestions: $guideQuestions, ')
          ..write('notificationSchedule: $notificationSchedule, ')
          ..write('isArchived: $isArchived, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalEntriesTable extends GoalEntries
    with TableInfo<$GoalEntriesTable, GoalEntryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _journalEntryIdMeta =
      const VerificationMeta('journalEntryId');
  @override
  late final GeneratedColumn<String> journalEntryId = GeneratedColumn<String>(
      'journal_entry_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES journal_entries (id)'));
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
      'goal_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES goals (id)'));
  @override
  List<GeneratedColumn> get $columns => [journalEntryId, goalId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_entries';
  @override
  VerificationContext validateIntegrity(Insertable<GoalEntryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('journal_entry_id')) {
      context.handle(
          _journalEntryIdMeta,
          journalEntryId.isAcceptableOrUnknown(
              data['journal_entry_id']!, _journalEntryIdMeta));
    } else if (isInserting) {
      context.missing(_journalEntryIdMeta);
    }
    if (data.containsKey('goal_id')) {
      context.handle(_goalIdMeta,
          goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta));
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {journalEntryId};
  @override
  GoalEntryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalEntryEntity(
      journalEntryId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}journal_entry_id'])!,
      goalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_id'])!,
    );
  }

  @override
  $GoalEntriesTable createAlias(String alias) {
    return $GoalEntriesTable(attachedDatabase, alias);
  }
}

class GoalEntryEntity extends DataClass implements Insertable<GoalEntryEntity> {
  final String journalEntryId;
  final String goalId;
  const GoalEntryEntity({required this.journalEntryId, required this.goalId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['journal_entry_id'] = Variable<String>(journalEntryId);
    map['goal_id'] = Variable<String>(goalId);
    return map;
  }

  GoalEntriesCompanion toCompanion(bool nullToAbsent) {
    return GoalEntriesCompanion(
      journalEntryId: Value(journalEntryId),
      goalId: Value(goalId),
    );
  }

  factory GoalEntryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalEntryEntity(
      journalEntryId: serializer.fromJson<String>(json['journalEntryId']),
      goalId: serializer.fromJson<String>(json['goalId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'journalEntryId': serializer.toJson<String>(journalEntryId),
      'goalId': serializer.toJson<String>(goalId),
    };
  }

  GoalEntryEntity copyWith({String? journalEntryId, String? goalId}) =>
      GoalEntryEntity(
        journalEntryId: journalEntryId ?? this.journalEntryId,
        goalId: goalId ?? this.goalId,
      );
  GoalEntryEntity copyWithCompanion(GoalEntriesCompanion data) {
    return GoalEntryEntity(
      journalEntryId: data.journalEntryId.present
          ? data.journalEntryId.value
          : this.journalEntryId,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalEntryEntity(')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('goalId: $goalId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(journalEntryId, goalId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalEntryEntity &&
          other.journalEntryId == this.journalEntryId &&
          other.goalId == this.goalId);
}

class GoalEntriesCompanion extends UpdateCompanion<GoalEntryEntity> {
  final Value<String> journalEntryId;
  final Value<String> goalId;
  final Value<int> rowid;
  const GoalEntriesCompanion({
    this.journalEntryId = const Value.absent(),
    this.goalId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalEntriesCompanion.insert({
    required String journalEntryId,
    required String goalId,
    this.rowid = const Value.absent(),
  })  : journalEntryId = Value(journalEntryId),
        goalId = Value(goalId);
  static Insertable<GoalEntryEntity> custom({
    Expression<String>? journalEntryId,
    Expression<String>? goalId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (journalEntryId != null) 'journal_entry_id': journalEntryId,
      if (goalId != null) 'goal_id': goalId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalEntriesCompanion copyWith(
      {Value<String>? journalEntryId,
      Value<String>? goalId,
      Value<int>? rowid}) {
    return GoalEntriesCompanion(
      journalEntryId: journalEntryId ?? this.journalEntryId,
      goalId: goalId ?? this.goalId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (journalEntryId.present) {
      map['journal_entry_id'] = Variable<String>(journalEntryId.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalEntriesCompanion(')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('goalId: $goalId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $GuidedJournalsTable guidedJournals = $GuidedJournalsTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $GoalEntriesTable goalEntries = $GoalEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, guidedJournals, journalEntries, goals, goalEntries];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String email,
  Value<DateTime> createdAt,
  required String displayName,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> email,
  Value<DateTime> createdAt,
  Value<String> displayName,
  Value<int> rowid,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, UserEntity> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JournalEntriesTable, List<JournalEntryEntity>>
      _journalEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.journalEntries,
              aliasName:
                  $_aliasNameGenerator(db.users.id, db.journalEntries.userId));

  $$JournalEntriesTableProcessedTableManager get journalEntriesRefs {
    final manager = $$JournalEntriesTableTableManager($_db, $_db.journalEntries)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_journalEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$GoalsTable, List<GoalEntity>> _goalsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.goals,
          aliasName: $_aliasNameGenerator(db.users.id, db.goals.userId));

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager($_db, $_db.goals)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

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
    PrefetchHooks Function({bool journalEntriesRefs, bool goalsRefs})> {
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
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            email: email,
            createdAt: createdAt,
            displayName: displayName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String email,
            Value<DateTime> createdAt = const Value.absent(),
            required String displayName,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            email: email,
            createdAt: createdAt,
            displayName: displayName,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {journalEntriesRefs = false, goalsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (journalEntriesRefs) db.journalEntries,
                if (goalsRefs) db.goals
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (journalEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._journalEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .journalEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items),
                  if (goalsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._goalsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).goalsRefs,
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
    PrefetchHooks Function({bool journalEntriesRefs, bool goalsRefs})>;
typedef $$GuidedJournalsTableCreateCompanionBuilder = GuidedJournalsCompanion
    Function({
  required String id,
  required String title,
  required List<String> guideQuestions,
  required String description,
  required List<String> journalType,
  Value<int> rowid,
});
typedef $$GuidedJournalsTableUpdateCompanionBuilder = GuidedJournalsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<List<String>> guideQuestions,
  Value<String> description,
  Value<List<String>> journalType,
  Value<int> rowid,
});

final class $$GuidedJournalsTableReferences extends BaseReferences<
    _$AppDatabase, $GuidedJournalsTable, GuidedJournalEntity> {
  $$GuidedJournalsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JournalEntriesTable, List<JournalEntryEntity>>
      _journalEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.journalEntries,
              aliasName: $_aliasNameGenerator(
                  db.guidedJournals.id, db.journalEntries.guidedJournal));

  $$JournalEntriesTableProcessedTableManager get journalEntriesRefs {
    final manager = $$JournalEntriesTableTableManager($_db, $_db.journalEntries)
        .filter((f) => f.guidedJournal.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_journalEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GuidedJournalsTableFilterComposer
    extends Composer<_$AppDatabase, $GuidedJournalsTable> {
  $$GuidedJournalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get guideQuestions => $composableBuilder(
          column: $table.guideQuestions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get journalType => $composableBuilder(
          column: $table.journalType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> journalEntriesRefs(
      Expression<bool> Function($$JournalEntriesTableFilterComposer f) f) {
    final $$JournalEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.journalEntries,
        getReferencedColumn: (t) => t.guidedJournal,
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

class $$GuidedJournalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GuidedJournalsTable> {
  $$GuidedJournalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guideQuestions => $composableBuilder(
      column: $table.guideQuestions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get journalType => $composableBuilder(
      column: $table.journalType, builder: (column) => ColumnOrderings(column));
}

class $$GuidedJournalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GuidedJournalsTable> {
  $$GuidedJournalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get guideQuestions =>
      $composableBuilder(
          column: $table.guideQuestions, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get journalType =>
      $composableBuilder(
          column: $table.journalType, builder: (column) => column);

  Expression<T> journalEntriesRefs<T extends Object>(
      Expression<T> Function($$JournalEntriesTableAnnotationComposer a) f) {
    final $$JournalEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.journalEntries,
        getReferencedColumn: (t) => t.guidedJournal,
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

class $$GuidedJournalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GuidedJournalsTable,
    GuidedJournalEntity,
    $$GuidedJournalsTableFilterComposer,
    $$GuidedJournalsTableOrderingComposer,
    $$GuidedJournalsTableAnnotationComposer,
    $$GuidedJournalsTableCreateCompanionBuilder,
    $$GuidedJournalsTableUpdateCompanionBuilder,
    (GuidedJournalEntity, $$GuidedJournalsTableReferences),
    GuidedJournalEntity,
    PrefetchHooks Function({bool journalEntriesRefs})> {
  $$GuidedJournalsTableTableManager(
      _$AppDatabase db, $GuidedJournalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuidedJournalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuidedJournalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuidedJournalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<List<String>> guideQuestions = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<List<String>> journalType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GuidedJournalsCompanion(
            id: id,
            title: title,
            guideQuestions: guideQuestions,
            description: description,
            journalType: journalType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required List<String> guideQuestions,
            required String description,
            required List<String> journalType,
            Value<int> rowid = const Value.absent(),
          }) =>
              GuidedJournalsCompanion.insert(
            id: id,
            title: title,
            guideQuestions: guideQuestions,
            description: description,
            journalType: journalType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GuidedJournalsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({journalEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (journalEntriesRefs) db.journalEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (journalEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GuidedJournalsTableReferences
                            ._journalEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GuidedJournalsTableReferences(db, table, p0)
                                .journalEntriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.guidedJournal == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GuidedJournalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GuidedJournalsTable,
    GuidedJournalEntity,
    $$GuidedJournalsTableFilterComposer,
    $$GuidedJournalsTableOrderingComposer,
    $$GuidedJournalsTableAnnotationComposer,
    $$GuidedJournalsTableCreateCompanionBuilder,
    $$GuidedJournalsTableUpdateCompanionBuilder,
    (GuidedJournalEntity, $$GuidedJournalsTableReferences),
    GuidedJournalEntity,
    PrefetchHooks Function({bool journalEntriesRefs})>;
typedef $$JournalEntriesTableCreateCompanionBuilder = JournalEntriesCompanion
    Function({
  required String id,
  required String userId,
  Value<DateTime> createdAt,
  required String guidedJournal,
  Value<String?> title,
  required List<Map<String, String>> content,
  Value<int> rowid,
});
typedef $$JournalEntriesTableUpdateCompanionBuilder = JournalEntriesCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<DateTime> createdAt,
  Value<String> guidedJournal,
  Value<String?> title,
  Value<List<Map<String, String>>> content,
  Value<int> rowid,
});

final class $$JournalEntriesTableReferences extends BaseReferences<
    _$AppDatabase, $JournalEntriesTable, JournalEntryEntity> {
  $$JournalEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.journalEntries.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GuidedJournalsTable _guidedJournalTable(_$AppDatabase db) =>
      db.guidedJournals.createAlias($_aliasNameGenerator(
          db.journalEntries.guidedJournal, db.guidedJournals.id));

  $$GuidedJournalsTableProcessedTableManager get guidedJournal {
    final manager = $$GuidedJournalsTableTableManager($_db, $_db.guidedJournals)
        .filter((f) => f.id($_item.guidedJournal));
    final item = $_typedResult.readTableOrNull(_guidedJournalTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$GoalEntriesTable, List<GoalEntryEntity>>
      _goalEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.goalEntries,
              aliasName: $_aliasNameGenerator(
                  db.journalEntries.id, db.goalEntries.journalEntryId));

  $$GoalEntriesTableProcessedTableManager get goalEntriesRefs {
    final manager = $$GoalEntriesTableTableManager($_db, $_db.goalEntries)
        .filter((f) => f.journalEntryId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_goalEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<Map<String, String>>,
          List<Map<String, String>>, String>
      get content => $composableBuilder(
          column: $table.content,
          builder: (column) => ColumnWithTypeConverterFilters(column));

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

  $$GuidedJournalsTableFilterComposer get guidedJournal {
    final $$GuidedJournalsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.guidedJournal,
        referencedTable: $db.guidedJournals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GuidedJournalsTableFilterComposer(
              $db: $db,
              $table: $db.guidedJournals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> goalEntriesRefs(
      Expression<bool> Function($$GoalEntriesTableFilterComposer f) f) {
    final $$GoalEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.goalEntries,
        getReferencedColumn: (t) => t.journalEntryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalEntriesTableFilterComposer(
              $db: $db,
              $table: $db.goalEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

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

  $$GuidedJournalsTableOrderingComposer get guidedJournal {
    final $$GuidedJournalsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.guidedJournal,
        referencedTable: $db.guidedJournals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GuidedJournalsTableOrderingComposer(
              $db: $db,
              $table: $db.guidedJournals,
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      get content => $composableBuilder(
          column: $table.content, builder: (column) => column);

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

  $$GuidedJournalsTableAnnotationComposer get guidedJournal {
    final $$GuidedJournalsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.guidedJournal,
        referencedTable: $db.guidedJournals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GuidedJournalsTableAnnotationComposer(
              $db: $db,
              $table: $db.guidedJournals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> goalEntriesRefs<T extends Object>(
      Expression<T> Function($$GoalEntriesTableAnnotationComposer a) f) {
    final $$GoalEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.goalEntries,
        getReferencedColumn: (t) => t.journalEntryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.goalEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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
    PrefetchHooks Function(
        {bool userId, bool guidedJournal, bool goalEntriesRefs})> {
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
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> guidedJournal = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<List<Map<String, String>>> content = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalEntriesCompanion(
            id: id,
            userId: userId,
            createdAt: createdAt,
            guidedJournal: guidedJournal,
            title: title,
            content: content,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            Value<DateTime> createdAt = const Value.absent(),
            required String guidedJournal,
            Value<String?> title = const Value.absent(),
            required List<Map<String, String>> content,
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalEntriesCompanion.insert(
            id: id,
            userId: userId,
            createdAt: createdAt,
            guidedJournal: guidedJournal,
            title: title,
            content: content,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JournalEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userId = false,
              guidedJournal = false,
              goalEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (goalEntriesRefs) db.goalEntries],
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
                if (guidedJournal) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.guidedJournal,
                    referencedTable:
                        $$JournalEntriesTableReferences._guidedJournalTable(db),
                    referencedColumn: $$JournalEntriesTableReferences
                        ._guidedJournalTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (goalEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$JournalEntriesTableReferences
                            ._goalEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$JournalEntriesTableReferences(db, table, p0)
                                .goalEntriesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.journalEntryId == item.id),
                        typedResults: items)
                ];
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
    PrefetchHooks Function(
        {bool userId, bool guidedJournal, bool goalEntriesRefs})>;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  required String id,
  required String userId,
  Value<DateTime> createdAt,
  required String title,
  required List<Map<String, String>> guideQuestions,
  required List<String> notificationSchedule,
  Value<bool> isArchived,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<DateTime> createdAt,
  Value<String> title,
  Value<List<Map<String, String>>> guideQuestions,
  Value<List<String>> notificationSchedule,
  Value<bool> isArchived,
  Value<int> rowid,
});

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, GoalEntity> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.goals.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$GoalEntriesTable, List<GoalEntryEntity>>
      _goalEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.goalEntries,
          aliasName: $_aliasNameGenerator(db.goals.id, db.goalEntries.goalId));

  $$GoalEntriesTableProcessedTableManager get goalEntriesRefs {
    final manager = $$GoalEntriesTableTableManager($_db, $_db.goalEntries)
        .filter((f) => f.goalId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_goalEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

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

  Expression<bool> goalEntriesRefs(
      Expression<bool> Function($$GoalEntriesTableFilterComposer f) f) {
    final $$GoalEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.goalEntries,
        getReferencedColumn: (t) => t.goalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalEntriesTableFilterComposer(
              $db: $db,
              $table: $db.goalEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guideQuestions => $composableBuilder(
      column: $table.guideQuestions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notificationSchedule => $composableBuilder(
      column: $table.notificationSchedule,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      get guideQuestions => $composableBuilder(
          column: $table.guideQuestions, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get notificationSchedule => $composableBuilder(
          column: $table.notificationSchedule, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

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

  Expression<T> goalEntriesRefs<T extends Object>(
      Expression<T> Function($$GoalEntriesTableAnnotationComposer a) f) {
    final $$GoalEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.goalEntries,
        getReferencedColumn: (t) => t.goalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.goalEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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
    PrefetchHooks Function({bool userId, bool goalEntriesRefs})> {
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
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<List<Map<String, String>>> guideQuestions =
                const Value.absent(),
            Value<List<String>> notificationSchedule = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion(
            id: id,
            userId: userId,
            createdAt: createdAt,
            title: title,
            guideQuestions: guideQuestions,
            notificationSchedule: notificationSchedule,
            isArchived: isArchived,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            Value<DateTime> createdAt = const Value.absent(),
            required String title,
            required List<Map<String, String>> guideQuestions,
            required List<String> notificationSchedule,
            Value<bool> isArchived = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion.insert(
            id: id,
            userId: userId,
            createdAt: createdAt,
            title: title,
            guideQuestions: guideQuestions,
            notificationSchedule: notificationSchedule,
            isArchived: isArchived,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GoalsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userId = false, goalEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (goalEntriesRefs) db.goalEntries],
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
                return [
                  if (goalEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GoalsTableReferences._goalEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GoalsTableReferences(db, table, p0)
                                .goalEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.goalId == item.id),
                        typedResults: items)
                ];
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
    PrefetchHooks Function({bool userId, bool goalEntriesRefs})>;
typedef $$GoalEntriesTableCreateCompanionBuilder = GoalEntriesCompanion
    Function({
  required String journalEntryId,
  required String goalId,
  Value<int> rowid,
});
typedef $$GoalEntriesTableUpdateCompanionBuilder = GoalEntriesCompanion
    Function({
  Value<String> journalEntryId,
  Value<String> goalId,
  Value<int> rowid,
});

final class $$GoalEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $GoalEntriesTable, GoalEntryEntity> {
  $$GoalEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $JournalEntriesTable _journalEntryIdTable(_$AppDatabase db) =>
      db.journalEntries.createAlias($_aliasNameGenerator(
          db.goalEntries.journalEntryId, db.journalEntries.id));

  $$JournalEntriesTableProcessedTableManager get journalEntryId {
    final manager = $$JournalEntriesTableTableManager($_db, $_db.journalEntries)
        .filter((f) => f.id($_item.journalEntryId));
    final item = $_typedResult.readTableOrNull(_journalEntryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GoalsTable _goalIdTable(_$AppDatabase db) => db.goals
      .createAlias($_aliasNameGenerator(db.goalEntries.goalId, db.goals.id));

  $$GoalsTableProcessedTableManager get goalId {
    final manager = $$GoalsTableTableManager($_db, $_db.goals)
        .filter((f) => f.id($_item.goalId));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GoalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $GoalEntriesTable> {
  $$GoalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$JournalEntriesTableFilterComposer get journalEntryId {
    final $$JournalEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.journalEntryId,
        referencedTable: $db.journalEntries,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$GoalsTableFilterComposer get goalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalId,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$GoalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalEntriesTable> {
  $$GoalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$JournalEntriesTableOrderingComposer get journalEntryId {
    final $$JournalEntriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.journalEntryId,
        referencedTable: $db.journalEntries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JournalEntriesTableOrderingComposer(
              $db: $db,
              $table: $db.journalEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GoalsTableOrderingComposer get goalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalId,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalsTableOrderingComposer(
              $db: $db,
              $table: $db.goals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GoalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalEntriesTable> {
  $$GoalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$JournalEntriesTableAnnotationComposer get journalEntryId {
    final $$JournalEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.journalEntryId,
        referencedTable: $db.journalEntries,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$GoalsTableAnnotationComposer get goalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalId,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$GoalEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalEntriesTable,
    GoalEntryEntity,
    $$GoalEntriesTableFilterComposer,
    $$GoalEntriesTableOrderingComposer,
    $$GoalEntriesTableAnnotationComposer,
    $$GoalEntriesTableCreateCompanionBuilder,
    $$GoalEntriesTableUpdateCompanionBuilder,
    (GoalEntryEntity, $$GoalEntriesTableReferences),
    GoalEntryEntity,
    PrefetchHooks Function({bool journalEntryId, bool goalId})> {
  $$GoalEntriesTableTableManager(_$AppDatabase db, $GoalEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> journalEntryId = const Value.absent(),
            Value<String> goalId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalEntriesCompanion(
            journalEntryId: journalEntryId,
            goalId: goalId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String journalEntryId,
            required String goalId,
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalEntriesCompanion.insert(
            journalEntryId: journalEntryId,
            goalId: goalId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GoalEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({journalEntryId = false, goalId = false}) {
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
                if (journalEntryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.journalEntryId,
                    referencedTable:
                        $$GoalEntriesTableReferences._journalEntryIdTable(db),
                    referencedColumn: $$GoalEntriesTableReferences
                        ._journalEntryIdTable(db)
                        .id,
                  ) as T;
                }
                if (goalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.goalId,
                    referencedTable:
                        $$GoalEntriesTableReferences._goalIdTable(db),
                    referencedColumn:
                        $$GoalEntriesTableReferences._goalIdTable(db).id,
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

typedef $$GoalEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalEntriesTable,
    GoalEntryEntity,
    $$GoalEntriesTableFilterComposer,
    $$GoalEntriesTableOrderingComposer,
    $$GoalEntriesTableAnnotationComposer,
    $$GoalEntriesTableCreateCompanionBuilder,
    $$GoalEntriesTableUpdateCompanionBuilder,
    (GoalEntryEntity, $$GoalEntriesTableReferences),
    GoalEntryEntity,
    PrefetchHooks Function({bool journalEntryId, bool goalId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$GuidedJournalsTableTableManager get guidedJournals =>
      $$GuidedJournalsTableTableManager(_db, _db.guidedJournals);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$GoalEntriesTableTableManager get goalEntries =>
      $$GoalEntriesTableTableManager(_db, _db.goalEntries);
}
