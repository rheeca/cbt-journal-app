//
//  Generated code. Do not modify.
//  source: goal_checkin.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $6;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ReadGoalCheckInsRequest extends $pb.GeneratedMessage {
  factory ReadGoalCheckInsRequest({
    $core.String? userId,
    $6.Timestamp? lastSynced,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (lastSynced != null) {
      $result.lastSynced = lastSynced;
    }
    return $result;
  }
  ReadGoalCheckInsRequest._() : super();
  factory ReadGoalCheckInsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadGoalCheckInsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadGoalCheckInsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOM<$6.Timestamp>(2, _omitFieldNames ? '' : 'lastSynced', subBuilder: $6.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadGoalCheckInsRequest clone() => ReadGoalCheckInsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadGoalCheckInsRequest copyWith(void Function(ReadGoalCheckInsRequest) updates) => super.copyWith((message) => updates(message as ReadGoalCheckInsRequest)) as ReadGoalCheckInsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadGoalCheckInsRequest create() => ReadGoalCheckInsRequest._();
  ReadGoalCheckInsRequest createEmptyInstance() => create();
  static $pb.PbList<ReadGoalCheckInsRequest> createRepeated() => $pb.PbList<ReadGoalCheckInsRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadGoalCheckInsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadGoalCheckInsRequest>(create);
  static ReadGoalCheckInsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $6.Timestamp get lastSynced => $_getN(1);
  @$pb.TagNumber(2)
  set lastSynced($6.Timestamp v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastSynced() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastSynced() => $_clearField(2);
  @$pb.TagNumber(2)
  $6.Timestamp ensureLastSynced() => $_ensure(1);
}

class ReadGoalCheckInsResponse extends $pb.GeneratedMessage {
  factory ReadGoalCheckInsResponse({
    $core.Iterable<GoalCheckIn>? goalCheckIns,
  }) {
    final $result = create();
    if (goalCheckIns != null) {
      $result.goalCheckIns.addAll(goalCheckIns);
    }
    return $result;
  }
  ReadGoalCheckInsResponse._() : super();
  factory ReadGoalCheckInsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadGoalCheckInsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadGoalCheckInsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..pc<GoalCheckIn>(1, _omitFieldNames ? '' : 'goalCheckIns', $pb.PbFieldType.PM, protoName: 'goalCheckIns', subBuilder: GoalCheckIn.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadGoalCheckInsResponse clone() => ReadGoalCheckInsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadGoalCheckInsResponse copyWith(void Function(ReadGoalCheckInsResponse) updates) => super.copyWith((message) => updates(message as ReadGoalCheckInsResponse)) as ReadGoalCheckInsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadGoalCheckInsResponse create() => ReadGoalCheckInsResponse._();
  ReadGoalCheckInsResponse createEmptyInstance() => create();
  static $pb.PbList<ReadGoalCheckInsResponse> createRepeated() => $pb.PbList<ReadGoalCheckInsResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadGoalCheckInsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadGoalCheckInsResponse>(create);
  static ReadGoalCheckInsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GoalCheckIn> get goalCheckIns => $_getList(0);
}

class WriteGoalCheckInsRequest extends $pb.GeneratedMessage {
  factory WriteGoalCheckInsRequest({
    $core.Iterable<GoalCheckIn>? goalCheckIns,
  }) {
    final $result = create();
    if (goalCheckIns != null) {
      $result.goalCheckIns.addAll(goalCheckIns);
    }
    return $result;
  }
  WriteGoalCheckInsRequest._() : super();
  factory WriteGoalCheckInsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteGoalCheckInsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteGoalCheckInsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..pc<GoalCheckIn>(1, _omitFieldNames ? '' : 'goalCheckIns', $pb.PbFieldType.PM, protoName: 'goalCheckIns', subBuilder: GoalCheckIn.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteGoalCheckInsRequest clone() => WriteGoalCheckInsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteGoalCheckInsRequest copyWith(void Function(WriteGoalCheckInsRequest) updates) => super.copyWith((message) => updates(message as WriteGoalCheckInsRequest)) as WriteGoalCheckInsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WriteGoalCheckInsRequest create() => WriteGoalCheckInsRequest._();
  WriteGoalCheckInsRequest createEmptyInstance() => create();
  static $pb.PbList<WriteGoalCheckInsRequest> createRepeated() => $pb.PbList<WriteGoalCheckInsRequest>();
  @$core.pragma('dart2js:noInline')
  static WriteGoalCheckInsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteGoalCheckInsRequest>(create);
  static WriteGoalCheckInsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GoalCheckIn> get goalCheckIns => $_getList(0);
}

class WriteGoalCheckInsResponse extends $pb.GeneratedMessage {
  factory WriteGoalCheckInsResponse({
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
  WriteGoalCheckInsResponse._() : super();
  factory WriteGoalCheckInsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteGoalCheckInsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteGoalCheckInsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteGoalCheckInsResponse clone() => WriteGoalCheckInsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteGoalCheckInsResponse copyWith(void Function(WriteGoalCheckInsResponse) updates) => super.copyWith((message) => updates(message as WriteGoalCheckInsResponse)) as WriteGoalCheckInsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WriteGoalCheckInsResponse create() => WriteGoalCheckInsResponse._();
  WriteGoalCheckInsResponse createEmptyInstance() => create();
  static $pb.PbList<WriteGoalCheckInsResponse> createRepeated() => $pb.PbList<WriteGoalCheckInsResponse>();
  @$core.pragma('dart2js:noInline')
  static WriteGoalCheckInsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteGoalCheckInsResponse>(create);
  static WriteGoalCheckInsResponse? _defaultInstance;

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

class GoalCheckIn extends $pb.GeneratedMessage {
  factory GoalCheckIn({
    $core.String? userId,
    $6.Timestamp? date,
    $core.Iterable<$core.String>? goals,
    $6.Timestamp? updatedAt,
    $core.bool? isDeleted,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (date != null) {
      $result.date = date;
    }
    if (goals != null) {
      $result.goals.addAll(goals);
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (isDeleted != null) {
      $result.isDeleted = isDeleted;
    }
    return $result;
  }
  GoalCheckIn._() : super();
  factory GoalCheckIn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GoalCheckIn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GoalCheckIn', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOM<$6.Timestamp>(2, _omitFieldNames ? '' : 'date', subBuilder: $6.Timestamp.create)
    ..pPS(3, _omitFieldNames ? '' : 'goals')
    ..aOM<$6.Timestamp>(4, _omitFieldNames ? '' : 'updatedAt', subBuilder: $6.Timestamp.create)
    ..aOB(5, _omitFieldNames ? '' : 'isDeleted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GoalCheckIn clone() => GoalCheckIn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GoalCheckIn copyWith(void Function(GoalCheckIn) updates) => super.copyWith((message) => updates(message as GoalCheckIn)) as GoalCheckIn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GoalCheckIn create() => GoalCheckIn._();
  GoalCheckIn createEmptyInstance() => create();
  static $pb.PbList<GoalCheckIn> createRepeated() => $pb.PbList<GoalCheckIn>();
  @$core.pragma('dart2js:noInline')
  static GoalCheckIn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GoalCheckIn>(create);
  static GoalCheckIn? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $6.Timestamp get date => $_getN(1);
  @$pb.TagNumber(2)
  set date($6.Timestamp v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $6.Timestamp ensureDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get goals => $_getList(2);

  @$pb.TagNumber(4)
  $6.Timestamp get updatedAt => $_getN(3);
  @$pb.TagNumber(4)
  set updatedAt($6.Timestamp v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdatedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $6.Timestamp ensureUpdatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get isDeleted => $_getBF(4);
  @$pb.TagNumber(5)
  set isDeleted($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsDeleted() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsDeleted() => $_clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
