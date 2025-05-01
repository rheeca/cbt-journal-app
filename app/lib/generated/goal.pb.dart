//
//  Generated code. Do not modify.
//  source: goal.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $5;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ReadGoalsRequest extends $pb.GeneratedMessage {
  factory ReadGoalsRequest({
    $core.String? userId,
    $5.Timestamp? lastSynced,
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
  ReadGoalsRequest._() : super();
  factory ReadGoalsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadGoalsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadGoalsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOM<$5.Timestamp>(2, _omitFieldNames ? '' : 'lastSynced', subBuilder: $5.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadGoalsRequest clone() => ReadGoalsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadGoalsRequest copyWith(void Function(ReadGoalsRequest) updates) => super.copyWith((message) => updates(message as ReadGoalsRequest)) as ReadGoalsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadGoalsRequest create() => ReadGoalsRequest._();
  ReadGoalsRequest createEmptyInstance() => create();
  static $pb.PbList<ReadGoalsRequest> createRepeated() => $pb.PbList<ReadGoalsRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadGoalsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadGoalsRequest>(create);
  static ReadGoalsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $5.Timestamp get lastSynced => $_getN(1);
  @$pb.TagNumber(2)
  set lastSynced($5.Timestamp v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastSynced() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastSynced() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.Timestamp ensureLastSynced() => $_ensure(1);
}

class ReadGoalsResponse extends $pb.GeneratedMessage {
  factory ReadGoalsResponse({
    $core.Iterable<Goal>? goals,
  }) {
    final $result = create();
    if (goals != null) {
      $result.goals.addAll(goals);
    }
    return $result;
  }
  ReadGoalsResponse._() : super();
  factory ReadGoalsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadGoalsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadGoalsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..pc<Goal>(1, _omitFieldNames ? '' : 'goals', $pb.PbFieldType.PM, subBuilder: Goal.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadGoalsResponse clone() => ReadGoalsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadGoalsResponse copyWith(void Function(ReadGoalsResponse) updates) => super.copyWith((message) => updates(message as ReadGoalsResponse)) as ReadGoalsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadGoalsResponse create() => ReadGoalsResponse._();
  ReadGoalsResponse createEmptyInstance() => create();
  static $pb.PbList<ReadGoalsResponse> createRepeated() => $pb.PbList<ReadGoalsResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadGoalsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadGoalsResponse>(create);
  static ReadGoalsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Goal> get goals => $_getList(0);
}

class WriteGoalsRequest extends $pb.GeneratedMessage {
  factory WriteGoalsRequest({
    $core.Iterable<Goal>? goals,
  }) {
    final $result = create();
    if (goals != null) {
      $result.goals.addAll(goals);
    }
    return $result;
  }
  WriteGoalsRequest._() : super();
  factory WriteGoalsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteGoalsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteGoalsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..pc<Goal>(1, _omitFieldNames ? '' : 'goals', $pb.PbFieldType.PM, subBuilder: Goal.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteGoalsRequest clone() => WriteGoalsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteGoalsRequest copyWith(void Function(WriteGoalsRequest) updates) => super.copyWith((message) => updates(message as WriteGoalsRequest)) as WriteGoalsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WriteGoalsRequest create() => WriteGoalsRequest._();
  WriteGoalsRequest createEmptyInstance() => create();
  static $pb.PbList<WriteGoalsRequest> createRepeated() => $pb.PbList<WriteGoalsRequest>();
  @$core.pragma('dart2js:noInline')
  static WriteGoalsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteGoalsRequest>(create);
  static WriteGoalsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Goal> get goals => $_getList(0);
}

class WriteGoalsResponse extends $pb.GeneratedMessage {
  factory WriteGoalsResponse({
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
  WriteGoalsResponse._() : super();
  factory WriteGoalsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteGoalsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteGoalsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteGoalsResponse clone() => WriteGoalsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteGoalsResponse copyWith(void Function(WriteGoalsResponse) updates) => super.copyWith((message) => updates(message as WriteGoalsResponse)) as WriteGoalsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WriteGoalsResponse create() => WriteGoalsResponse._();
  WriteGoalsResponse createEmptyInstance() => create();
  static $pb.PbList<WriteGoalsResponse> createRepeated() => $pb.PbList<WriteGoalsResponse>();
  @$core.pragma('dart2js:noInline')
  static WriteGoalsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteGoalsResponse>(create);
  static WriteGoalsResponse? _defaultInstance;

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

class DeleteGoalsRequest extends $pb.GeneratedMessage {
  factory DeleteGoalsRequest({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  DeleteGoalsRequest._() : super();
  factory DeleteGoalsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteGoalsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGoalsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteGoalsRequest clone() => DeleteGoalsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteGoalsRequest copyWith(void Function(DeleteGoalsRequest) updates) => super.copyWith((message) => updates(message as DeleteGoalsRequest)) as DeleteGoalsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGoalsRequest create() => DeleteGoalsRequest._();
  DeleteGoalsRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteGoalsRequest> createRepeated() => $pb.PbList<DeleteGoalsRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteGoalsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGoalsRequest>(create);
  static DeleteGoalsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get ids => $_getList(0);
}

class DeleteGoalsResponse extends $pb.GeneratedMessage {
  factory DeleteGoalsResponse({
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
  DeleteGoalsResponse._() : super();
  factory DeleteGoalsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteGoalsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGoalsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteGoalsResponse clone() => DeleteGoalsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteGoalsResponse copyWith(void Function(DeleteGoalsResponse) updates) => super.copyWith((message) => updates(message as DeleteGoalsResponse)) as DeleteGoalsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGoalsResponse create() => DeleteGoalsResponse._();
  DeleteGoalsResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteGoalsResponse> createRepeated() => $pb.PbList<DeleteGoalsResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteGoalsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGoalsResponse>(create);
  static DeleteGoalsResponse? _defaultInstance;

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

class Goal extends $pb.GeneratedMessage {
  factory Goal({
    $core.String? id,
    $core.String? userId,
    $5.Timestamp? createdAt,
    $core.String? title,
    $core.String? type,
    $core.Iterable<GuideQuestion>? guideQuestions,
    $core.Iterable<$core.String>? notificationSchedule,
    $core.bool? isArchived,
    $5.Timestamp? updatedAt,
    $core.bool? isDeleted,
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
    if (title != null) {
      $result.title = title;
    }
    if (type != null) {
      $result.type = type;
    }
    if (guideQuestions != null) {
      $result.guideQuestions.addAll(guideQuestions);
    }
    if (notificationSchedule != null) {
      $result.notificationSchedule.addAll(notificationSchedule);
    }
    if (isArchived != null) {
      $result.isArchived = isArchived;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (isDeleted != null) {
      $result.isDeleted = isDeleted;
    }
    return $result;
  }
  Goal._() : super();
  factory Goal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Goal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Goal', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOM<$5.Timestamp>(3, _omitFieldNames ? '' : 'createdAt', subBuilder: $5.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOS(5, _omitFieldNames ? '' : 'type')
    ..pc<GuideQuestion>(6, _omitFieldNames ? '' : 'guideQuestions', $pb.PbFieldType.PM, subBuilder: GuideQuestion.create)
    ..pPS(7, _omitFieldNames ? '' : 'notificationSchedule')
    ..aOB(8, _omitFieldNames ? '' : 'isArchived')
    ..aOM<$5.Timestamp>(9, _omitFieldNames ? '' : 'updatedAt', subBuilder: $5.Timestamp.create)
    ..aOB(10, _omitFieldNames ? '' : 'isDeleted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Goal clone() => Goal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Goal copyWith(void Function(Goal) updates) => super.copyWith((message) => updates(message as Goal)) as Goal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Goal create() => Goal._();
  Goal createEmptyInstance() => create();
  static $pb.PbList<Goal> createRepeated() => $pb.PbList<Goal>();
  @$core.pragma('dart2js:noInline')
  static Goal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Goal>(create);
  static Goal? _defaultInstance;

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
  $5.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($5.Timestamp v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $5.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<GuideQuestion> get guideQuestions => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get notificationSchedule => $_getList(6);

  @$pb.TagNumber(8)
  $core.bool get isArchived => $_getBF(7);
  @$pb.TagNumber(8)
  set isArchived($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsArchived() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsArchived() => $_clearField(8);

  @$pb.TagNumber(9)
  $5.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($5.Timestamp v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $5.Timestamp ensureUpdatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.bool get isDeleted => $_getBF(9);
  @$pb.TagNumber(10)
  set isDeleted($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsDeleted() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsDeleted() => $_clearField(10);
}

class GuideQuestion extends $pb.GeneratedMessage {
  factory GuideQuestion({
    $core.String? question,
    $core.String? answer,
    $core.String? type,
    $core.String? answerType,
    $core.String? answerCanvasElements,
    $core.List<$core.int>? answerCanvasImage,
  }) {
    final $result = create();
    if (question != null) {
      $result.question = question;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    if (type != null) {
      $result.type = type;
    }
    if (answerType != null) {
      $result.answerType = answerType;
    }
    if (answerCanvasElements != null) {
      $result.answerCanvasElements = answerCanvasElements;
    }
    if (answerCanvasImage != null) {
      $result.answerCanvasImage = answerCanvasImage;
    }
    return $result;
  }
  GuideQuestion._() : super();
  factory GuideQuestion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GuideQuestion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GuideQuestion', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'question')
    ..aOS(2, _omitFieldNames ? '' : 'answer')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'answerType')
    ..aOS(5, _omitFieldNames ? '' : 'answerCanvasElements')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'answerCanvasImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GuideQuestion clone() => GuideQuestion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GuideQuestion copyWith(void Function(GuideQuestion) updates) => super.copyWith((message) => updates(message as GuideQuestion)) as GuideQuestion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuideQuestion create() => GuideQuestion._();
  GuideQuestion createEmptyInstance() => create();
  static $pb.PbList<GuideQuestion> createRepeated() => $pb.PbList<GuideQuestion>();
  @$core.pragma('dart2js:noInline')
  static GuideQuestion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GuideQuestion>(create);
  static GuideQuestion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get question => $_getSZ(0);
  @$pb.TagNumber(1)
  set question($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get answer => $_getSZ(1);
  @$pb.TagNumber(2)
  set answer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnswer() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get answerType => $_getSZ(3);
  @$pb.TagNumber(4)
  set answerType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAnswerType() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnswerType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get answerCanvasElements => $_getSZ(4);
  @$pb.TagNumber(5)
  set answerCanvasElements($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAnswerCanvasElements() => $_has(4);
  @$pb.TagNumber(5)
  void clearAnswerCanvasElements() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get answerCanvasImage => $_getN(5);
  @$pb.TagNumber(6)
  set answerCanvasImage($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAnswerCanvasImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearAnswerCanvasImage() => $_clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
