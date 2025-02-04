// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      guideQuestions = GeneratedColumn<String>(
              'guide_questions', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $GuidedJournalsTable.$converterguideQuestionsn);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, guideQuestions, description];
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
      guideQuestions: $GuidedJournalsTable.$converterguideQuestionsn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}guide_questions'])),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $GuidedJournalsTable createAlias(String alias) {
    return $GuidedJournalsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterguideQuestions =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterguideQuestionsn =
      NullAwareTypeConverter.wrap($converterguideQuestions);
}

class GuidedJournalEntity extends DataClass
    implements Insertable<GuidedJournalEntity> {
  final String id;
  final String title;
  final List<String>? guideQuestions;
  final String description;
  const GuidedJournalEntity(
      {required this.id,
      required this.title,
      this.guideQuestions,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || guideQuestions != null) {
      map['guide_questions'] = Variable<String>(
          $GuidedJournalsTable.$converterguideQuestionsn.toSql(guideQuestions));
    }
    map['description'] = Variable<String>(description);
    return map;
  }

  GuidedJournalsCompanion toCompanion(bool nullToAbsent) {
    return GuidedJournalsCompanion(
      id: Value(id),
      title: Value(title),
      guideQuestions: guideQuestions == null && nullToAbsent
          ? const Value.absent()
          : Value(guideQuestions),
      description: Value(description),
    );
  }

  factory GuidedJournalEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuidedJournalEntity(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      guideQuestions:
          serializer.fromJson<List<String>?>(json['guideQuestions']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'guideQuestions': serializer.toJson<List<String>?>(guideQuestions),
      'description': serializer.toJson<String>(description),
    };
  }

  GuidedJournalEntity copyWith(
          {String? id,
          String? title,
          Value<List<String>?> guideQuestions = const Value.absent(),
          String? description}) =>
      GuidedJournalEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        guideQuestions:
            guideQuestions.present ? guideQuestions.value : this.guideQuestions,
        description: description ?? this.description,
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuidedJournalEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('guideQuestions: $guideQuestions, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, guideQuestions, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuidedJournalEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.guideQuestions == this.guideQuestions &&
          other.description == this.description);
}

class GuidedJournalsCompanion extends UpdateCompanion<GuidedJournalEntity> {
  final Value<String> id;
  final Value<String> title;
  final Value<List<String>?> guideQuestions;
  final Value<String> description;
  final Value<int> rowid;
  const GuidedJournalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.guideQuestions = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GuidedJournalsCompanion.insert({
    required String id,
    required String title,
    this.guideQuestions = const Value.absent(),
    required String description,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description);
  static Insertable<GuidedJournalEntity> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? guideQuestions,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (guideQuestions != null) 'guide_questions': guideQuestions,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GuidedJournalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<List<String>?>? guideQuestions,
      Value<String>? description,
      Value<int>? rowid}) {
    return GuidedJournalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      guideQuestions: guideQuestions ?? this.guideQuestions,
      description: description ?? this.description,
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
          .$converterguideQuestionsn
          .toSql(guideQuestions.value));
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

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
      'created_at', aliasedName, true,
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
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
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
  final DateTime? createdAt;
  final String displayName;
  const UserEntity(
      {required this.id,
      required this.email,
      this.createdAt,
      required this.displayName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['display_name'] = Variable<String>(displayName);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      displayName: Value(displayName),
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntity(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      displayName: serializer.fromJson<String>(json['displayName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'displayName': serializer.toJson<String>(displayName),
    };
  }

  UserEntity copyWith(
          {String? id,
          String? email,
          Value<DateTime?> createdAt = const Value.absent(),
          String? displayName}) =>
      UserEntity(
        id: id ?? this.id,
        email: email ?? this.email,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
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
  final Value<DateTime?> createdAt;
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
      Value<DateTime?>? createdAt,
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
      'created_at', aliasedName, true,
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
  late final GeneratedColumnWithTypeConverter<List<String>?, String> content =
      GeneratedColumn<String>('content', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $JournalEntriesTable.$convertercontentn);
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
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      guidedJournal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guided_journal'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      content: $JournalEntriesTable.$convertercontentn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])),
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercontent =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertercontentn =
      NullAwareTypeConverter.wrap($convertercontent);
}

class JournalEntryEntity extends DataClass
    implements Insertable<JournalEntryEntity> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final String guidedJournal;
  final String? title;
  final List<String>? content;
  const JournalEntryEntity(
      {required this.id,
      required this.userId,
      this.createdAt,
      required this.guidedJournal,
      this.title,
      this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['guided_journal'] = Variable<String>(guidedJournal);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(
          $JournalEntriesTable.$convertercontentn.toSql(content));
    }
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      guidedJournal: Value(guidedJournal),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory JournalEntryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntryEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      guidedJournal: serializer.fromJson<String>(json['guidedJournal']),
      title: serializer.fromJson<String?>(json['title']),
      content: serializer.fromJson<List<String>?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'guidedJournal': serializer.toJson<String>(guidedJournal),
      'title': serializer.toJson<String?>(title),
      'content': serializer.toJson<List<String>?>(content),
    };
  }

  JournalEntryEntity copyWith(
          {String? id,
          String? userId,
          Value<DateTime?> createdAt = const Value.absent(),
          String? guidedJournal,
          Value<String?> title = const Value.absent(),
          Value<List<String>?> content = const Value.absent()}) =>
      JournalEntryEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        guidedJournal: guidedJournal ?? this.guidedJournal,
        title: title.present ? title.value : this.title,
        content: content.present ? content.value : this.content,
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
  final Value<DateTime?> createdAt;
  final Value<String> guidedJournal;
  final Value<String?> title;
  final Value<List<String>?> content;
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
    this.content = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        guidedJournal = Value(guidedJournal);
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
      Value<DateTime?>? createdAt,
      Value<String>? guidedJournal,
      Value<String?>? title,
      Value<List<String>?>? content,
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
          $JournalEntriesTable.$convertercontentn.toSql(content.value));
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GuidedJournalsTable guidedJournals = $GuidedJournalsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [guidedJournals, users, journalEntries];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$GuidedJournalsTableCreateCompanionBuilder = GuidedJournalsCompanion
    Function({
  required String id,
  required String title,
  Value<List<String>?> guideQuestions,
  required String description,
  Value<int> rowid,
});
typedef $$GuidedJournalsTableUpdateCompanionBuilder = GuidedJournalsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<List<String>?> guideQuestions,
  Value<String> description,
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

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get guideQuestions => $composableBuilder(
          column: $table.guideQuestions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

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

  GeneratedColumnWithTypeConverter<List<String>?, String> get guideQuestions =>
      $composableBuilder(
          column: $table.guideQuestions, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

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
            Value<List<String>?> guideQuestions = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GuidedJournalsCompanion(
            id: id,
            title: title,
            guideQuestions: guideQuestions,
            description: description,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<List<String>?> guideQuestions = const Value.absent(),
            required String description,
            Value<int> rowid = const Value.absent(),
          }) =>
              GuidedJournalsCompanion.insert(
            id: id,
            title: title,
            guideQuestions: guideQuestions,
            description: description,
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
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String id,
  required String email,
  Value<DateTime?> createdAt,
  required String displayName,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> id,
  Value<String> email,
  Value<DateTime?> createdAt,
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
    PrefetchHooks Function({bool journalEntriesRefs})> {
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
            Value<DateTime?> createdAt = const Value.absent(),
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
            Value<DateTime?> createdAt = const Value.absent(),
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
    PrefetchHooks Function({bool journalEntriesRefs})>;
typedef $$JournalEntriesTableCreateCompanionBuilder = JournalEntriesCompanion
    Function({
  required String id,
  required String userId,
  Value<DateTime?> createdAt,
  required String guidedJournal,
  Value<String?> title,
  Value<List<String>?> content,
  Value<int> rowid,
});
typedef $$JournalEntriesTableUpdateCompanionBuilder = JournalEntriesCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<DateTime?> createdAt,
  Value<String> guidedJournal,
  Value<String?> title,
  Value<List<String>?> content,
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

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
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

  GeneratedColumnWithTypeConverter<List<String>?, String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

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
    PrefetchHooks Function({bool userId, bool guidedJournal})> {
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
            Value<DateTime?> createdAt = const Value.absent(),
            Value<String> guidedJournal = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<List<String>?> content = const Value.absent(),
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
            Value<DateTime?> createdAt = const Value.absent(),
            required String guidedJournal,
            Value<String?> title = const Value.absent(),
            Value<List<String>?> content = const Value.absent(),
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
          prefetchHooksCallback: ({userId = false, guidedJournal = false}) {
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
    PrefetchHooks Function({bool userId, bool guidedJournal})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GuidedJournalsTableTableManager get guidedJournals =>
      $$GuidedJournalsTableTableManager(_db, _db.guidedJournals);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
}
