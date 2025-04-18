//
//  Generated code. Do not modify.
//  source: journal_entry.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'goal.pb.dart' as $0;
import 'google/protobuf/timestamp.pb.dart' as $4;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ReadJournalEntriesRequest extends $pb.GeneratedMessage {
  factory ReadJournalEntriesRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  ReadJournalEntriesRequest._() : super();
  factory ReadJournalEntriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadJournalEntriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadJournalEntriesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadJournalEntriesRequest clone() => ReadJournalEntriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadJournalEntriesRequest copyWith(void Function(ReadJournalEntriesRequest) updates) => super.copyWith((message) => updates(message as ReadJournalEntriesRequest)) as ReadJournalEntriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadJournalEntriesRequest create() => ReadJournalEntriesRequest._();
  ReadJournalEntriesRequest createEmptyInstance() => create();
  static $pb.PbList<ReadJournalEntriesRequest> createRepeated() => $pb.PbList<ReadJournalEntriesRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadJournalEntriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadJournalEntriesRequest>(create);
  static ReadJournalEntriesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class ReadJournalEntriesResponse extends $pb.GeneratedMessage {
  factory ReadJournalEntriesResponse({
    $core.Iterable<JournalEntry>? journalEntries,
  }) {
    final $result = create();
    if (journalEntries != null) {
      $result.journalEntries.addAll(journalEntries);
    }
    return $result;
  }
  ReadJournalEntriesResponse._() : super();
  factory ReadJournalEntriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadJournalEntriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadJournalEntriesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..pc<JournalEntry>(1, _omitFieldNames ? '' : 'journalEntries', $pb.PbFieldType.PM, subBuilder: JournalEntry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadJournalEntriesResponse clone() => ReadJournalEntriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadJournalEntriesResponse copyWith(void Function(ReadJournalEntriesResponse) updates) => super.copyWith((message) => updates(message as ReadJournalEntriesResponse)) as ReadJournalEntriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadJournalEntriesResponse create() => ReadJournalEntriesResponse._();
  ReadJournalEntriesResponse createEmptyInstance() => create();
  static $pb.PbList<ReadJournalEntriesResponse> createRepeated() => $pb.PbList<ReadJournalEntriesResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadJournalEntriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadJournalEntriesResponse>(create);
  static ReadJournalEntriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<JournalEntry> get journalEntries => $_getList(0);
}

class WriteJournalEntriesRequest extends $pb.GeneratedMessage {
  factory WriteJournalEntriesRequest({
    $core.Iterable<JournalEntry>? journalEntries,
  }) {
    final $result = create();
    if (journalEntries != null) {
      $result.journalEntries.addAll(journalEntries);
    }
    return $result;
  }
  WriteJournalEntriesRequest._() : super();
  factory WriteJournalEntriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteJournalEntriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteJournalEntriesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..pc<JournalEntry>(1, _omitFieldNames ? '' : 'journalEntries', $pb.PbFieldType.PM, subBuilder: JournalEntry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteJournalEntriesRequest clone() => WriteJournalEntriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteJournalEntriesRequest copyWith(void Function(WriteJournalEntriesRequest) updates) => super.copyWith((message) => updates(message as WriteJournalEntriesRequest)) as WriteJournalEntriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WriteJournalEntriesRequest create() => WriteJournalEntriesRequest._();
  WriteJournalEntriesRequest createEmptyInstance() => create();
  static $pb.PbList<WriteJournalEntriesRequest> createRepeated() => $pb.PbList<WriteJournalEntriesRequest>();
  @$core.pragma('dart2js:noInline')
  static WriteJournalEntriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteJournalEntriesRequest>(create);
  static WriteJournalEntriesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<JournalEntry> get journalEntries => $_getList(0);
}

class WriteJournalEntriesResponse extends $pb.GeneratedMessage {
  factory WriteJournalEntriesResponse({
    $core.int? status,
    $core.String? errorMessage,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    return $result;
  }
  WriteJournalEntriesResponse._() : super();
  factory WriteJournalEntriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteJournalEntriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteJournalEntriesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteJournalEntriesResponse clone() => WriteJournalEntriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteJournalEntriesResponse copyWith(void Function(WriteJournalEntriesResponse) updates) => super.copyWith((message) => updates(message as WriteJournalEntriesResponse)) as WriteJournalEntriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WriteJournalEntriesResponse create() => WriteJournalEntriesResponse._();
  WriteJournalEntriesResponse createEmptyInstance() => create();
  static $pb.PbList<WriteJournalEntriesResponse> createRepeated() => $pb.PbList<WriteJournalEntriesResponse>();
  @$core.pragma('dart2js:noInline')
  static WriteJournalEntriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteJournalEntriesResponse>(create);
  static WriteJournalEntriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => $_clearField(2);
}

class DeleteJournalEntriesRequest extends $pb.GeneratedMessage {
  factory DeleteJournalEntriesRequest({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  DeleteJournalEntriesRequest._() : super();
  factory DeleteJournalEntriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteJournalEntriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteJournalEntriesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteJournalEntriesRequest clone() => DeleteJournalEntriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteJournalEntriesRequest copyWith(void Function(DeleteJournalEntriesRequest) updates) => super.copyWith((message) => updates(message as DeleteJournalEntriesRequest)) as DeleteJournalEntriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteJournalEntriesRequest create() => DeleteJournalEntriesRequest._();
  DeleteJournalEntriesRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteJournalEntriesRequest> createRepeated() => $pb.PbList<DeleteJournalEntriesRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteJournalEntriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteJournalEntriesRequest>(create);
  static DeleteJournalEntriesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get ids => $_getList(0);
}

class DeleteJournalEntriesResponse extends $pb.GeneratedMessage {
  factory DeleteJournalEntriesResponse({
    $core.int? status,
    $core.String? errorMessage,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    return $result;
  }
  DeleteJournalEntriesResponse._() : super();
  factory DeleteJournalEntriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteJournalEntriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteJournalEntriesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteJournalEntriesResponse clone() => DeleteJournalEntriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteJournalEntriesResponse copyWith(void Function(DeleteJournalEntriesResponse) updates) => super.copyWith((message) => updates(message as DeleteJournalEntriesResponse)) as DeleteJournalEntriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteJournalEntriesResponse create() => DeleteJournalEntriesResponse._();
  DeleteJournalEntriesResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteJournalEntriesResponse> createRepeated() => $pb.PbList<DeleteJournalEntriesResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteJournalEntriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteJournalEntriesResponse>(create);
  static DeleteJournalEntriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => $_clearField(2);
}

class JournalEntry extends $pb.GeneratedMessage {
  factory JournalEntry({
    $core.String? id,
    $core.String? userId,
    $4.Timestamp? createdAt,
    $core.String? guidedJournal,
    $core.String? title,
    $core.Iterable<$0.GuideQuestion>? content,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (guidedJournal != null) {
      $result.guidedJournal = guidedJournal;
    }
    if (title != null) {
      $result.title = title;
    }
    if (content != null) {
      $result.content.addAll(content);
    }
    return $result;
  }
  JournalEntry._() : super();
  factory JournalEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JournalEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'JournalEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOM<$4.Timestamp>(3, _omitFieldNames ? '' : 'createdAt', subBuilder: $4.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'guidedJournal')
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..pc<$0.GuideQuestion>(6, _omitFieldNames ? '' : 'content', $pb.PbFieldType.PM, subBuilder: $0.GuideQuestion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JournalEntry clone() => JournalEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JournalEntry copyWith(void Function(JournalEntry) updates) => super.copyWith((message) => updates(message as JournalEntry)) as JournalEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JournalEntry create() => JournalEntry._();
  JournalEntry createEmptyInstance() => create();
  static $pb.PbList<JournalEntry> createRepeated() => $pb.PbList<JournalEntry>();
  @$core.pragma('dart2js:noInline')
  static JournalEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JournalEntry>(create);
  static JournalEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $4.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($4.Timestamp v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $4.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get guidedJournal => $_getSZ(3);
  @$pb.TagNumber(4)
  set guidedJournal($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGuidedJournal() => $_has(3);
  @$pb.TagNumber(4)
  void clearGuidedJournal() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$0.GuideQuestion> get content => $_getList(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
