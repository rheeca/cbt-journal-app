//
//  Generated code. Do not modify.
//  source: discover.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ReadGuidedJournalsRequest extends $pb.GeneratedMessage {
  factory ReadGuidedJournalsRequest() => create();
  ReadGuidedJournalsRequest._() : super();
  factory ReadGuidedJournalsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadGuidedJournalsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadGuidedJournalsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadGuidedJournalsRequest clone() => ReadGuidedJournalsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadGuidedJournalsRequest copyWith(void Function(ReadGuidedJournalsRequest) updates) => super.copyWith((message) => updates(message as ReadGuidedJournalsRequest)) as ReadGuidedJournalsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadGuidedJournalsRequest create() => ReadGuidedJournalsRequest._();
  ReadGuidedJournalsRequest createEmptyInstance() => create();
  static $pb.PbList<ReadGuidedJournalsRequest> createRepeated() => $pb.PbList<ReadGuidedJournalsRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadGuidedJournalsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadGuidedJournalsRequest>(create);
  static ReadGuidedJournalsRequest? _defaultInstance;
}

class ReadGuidedJournalsResponse extends $pb.GeneratedMessage {
  factory ReadGuidedJournalsResponse({
    $core.int? status,
    $core.String? errorMessage,
    $core.Iterable<GuidedJournal>? guidedJournals,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    if (guidedJournals != null) {
      $result.guidedJournals.addAll(guidedJournals);
    }
    return $result;
  }
  ReadGuidedJournalsResponse._() : super();
  factory ReadGuidedJournalsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadGuidedJournalsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadGuidedJournalsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..pc<GuidedJournal>(3, _omitFieldNames ? '' : 'guidedJournals', $pb.PbFieldType.PM, subBuilder: GuidedJournal.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadGuidedJournalsResponse clone() => ReadGuidedJournalsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadGuidedJournalsResponse copyWith(void Function(ReadGuidedJournalsResponse) updates) => super.copyWith((message) => updates(message as ReadGuidedJournalsResponse)) as ReadGuidedJournalsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadGuidedJournalsResponse create() => ReadGuidedJournalsResponse._();
  ReadGuidedJournalsResponse createEmptyInstance() => create();
  static $pb.PbList<ReadGuidedJournalsResponse> createRepeated() => $pb.PbList<ReadGuidedJournalsResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadGuidedJournalsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadGuidedJournalsResponse>(create);
  static ReadGuidedJournalsResponse? _defaultInstance;

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

  @$pb.TagNumber(3)
  $pb.PbList<GuidedJournal> get guidedJournals => $_getList(2);
}

class GuidedJournal extends $pb.GeneratedMessage {
  factory GuidedJournal({
    $core.String? id,
    $core.String? title,
    $core.Iterable<$core.String>? guideQuestions,
    $core.String? description,
    $core.Iterable<$core.String>? journalType,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (guideQuestions != null) {
      $result.guideQuestions.addAll(guideQuestions);
    }
    if (description != null) {
      $result.description = description;
    }
    if (journalType != null) {
      $result.journalType.addAll(journalType);
    }
    return $result;
  }
  GuidedJournal._() : super();
  factory GuidedJournal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GuidedJournal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GuidedJournal', package: const $pb.PackageName(_omitMessageNames ? '' : 'journal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..pPS(3, _omitFieldNames ? '' : 'guideQuestions')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..pPS(5, _omitFieldNames ? '' : 'journalType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GuidedJournal clone() => GuidedJournal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GuidedJournal copyWith(void Function(GuidedJournal) updates) => super.copyWith((message) => updates(message as GuidedJournal)) as GuidedJournal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuidedJournal create() => GuidedJournal._();
  GuidedJournal createEmptyInstance() => create();
  static $pb.PbList<GuidedJournal> createRepeated() => $pb.PbList<GuidedJournal>();
  @$core.pragma('dart2js:noInline')
  static GuidedJournal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GuidedJournal>(create);
  static GuidedJournal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get guideQuestions => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get journalType => $_getList(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
