//
//  Generated code. Do not modify.
//  source: goal.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readGoalsRequestDescriptor instead')
const ReadGoalsRequest$json = {
  '1': 'ReadGoalsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ReadGoalsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readGoalsRequestDescriptor = $convert.base64Decode(
    'ChBSZWFkR29hbHNSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use readGoalsResponseDescriptor instead')
const ReadGoalsResponse$json = {
  '1': 'ReadGoalsResponse',
  '2': [
    {'1': 'goals', '3': 1, '4': 3, '5': 11, '6': '.journal.Goal', '10': 'goals'},
  ],
};

/// Descriptor for `ReadGoalsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readGoalsResponseDescriptor = $convert.base64Decode(
    'ChFSZWFkR29hbHNSZXNwb25zZRIjCgVnb2FscxgBIAMoCzINLmpvdXJuYWwuR29hbFIFZ29hbH'
    'M=');

@$core.Deprecated('Use writeGoalsRequestDescriptor instead')
const WriteGoalsRequest$json = {
  '1': 'WriteGoalsRequest',
  '2': [
    {'1': 'goals', '3': 1, '4': 3, '5': 11, '6': '.journal.Goal', '10': 'goals'},
  ],
};

/// Descriptor for `WriteGoalsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeGoalsRequestDescriptor = $convert.base64Decode(
    'ChFXcml0ZUdvYWxzUmVxdWVzdBIjCgVnb2FscxgBIAMoCzINLmpvdXJuYWwuR29hbFIFZ29hbH'
    'M=');

@$core.Deprecated('Use writeGoalsResponseDescriptor instead')
const WriteGoalsResponse$json = {
  '1': 'WriteGoalsResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `WriteGoalsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeGoalsResponseDescriptor = $convert.base64Decode(
    'ChJXcml0ZUdvYWxzUmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSIwoNZXJyb3JfbW'
    'Vzc2FnZRgCIAEoCVIMZXJyb3JNZXNzYWdl');

@$core.Deprecated('Use deleteGoalsRequestDescriptor instead')
const DeleteGoalsRequest$json = {
  '1': 'DeleteGoalsRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `DeleteGoalsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGoalsRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVHb2Fsc1JlcXVlc3QSEAoDaWRzGAEgAygJUgNpZHM=');

@$core.Deprecated('Use deleteGoalsResponseDescriptor instead')
const DeleteGoalsResponse$json = {
  '1': 'DeleteGoalsResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `DeleteGoalsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGoalsResponseDescriptor = $convert.base64Decode(
    'ChNEZWxldGVHb2Fsc1Jlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEiMKDWVycm9yX2'
    '1lc3NhZ2UYAiABKAlSDGVycm9yTWVzc2FnZQ==');

@$core.Deprecated('Use goalDescriptor instead')
const Goal$json = {
  '1': 'Goal',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    {'1': 'type', '3': 5, '4': 1, '5': 9, '10': 'type'},
    {'1': 'guide_questions', '3': 6, '4': 3, '5': 11, '6': '.journal.GuideQuestion', '10': 'guideQuestions'},
    {'1': 'notification_schedule', '3': 7, '4': 3, '5': 9, '10': 'notificationSchedule'},
    {'1': 'is_archived', '3': 8, '4': 1, '5': 8, '10': 'isArchived'},
  ],
};

/// Descriptor for `Goal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List goalDescriptor = $convert.base64Decode(
    'CgRHb2FsEg4KAmlkGAEgASgJUgJpZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSOQoKY3JlYX'
    'RlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBIUCgV0'
    'aXRsZRgEIAEoCVIFdGl0bGUSEgoEdHlwZRgFIAEoCVIEdHlwZRI/Cg9ndWlkZV9xdWVzdGlvbn'
    'MYBiADKAsyFi5qb3VybmFsLkd1aWRlUXVlc3Rpb25SDmd1aWRlUXVlc3Rpb25zEjMKFW5vdGlm'
    'aWNhdGlvbl9zY2hlZHVsZRgHIAMoCVIUbm90aWZpY2F0aW9uU2NoZWR1bGUSHwoLaXNfYXJjaG'
    'l2ZWQYCCABKAhSCmlzQXJjaGl2ZWQ=');

@$core.Deprecated('Use guideQuestionDescriptor instead')
const GuideQuestion$json = {
  '1': 'GuideQuestion',
  '2': [
    {'1': 'question', '3': 1, '4': 1, '5': 9, '10': 'question'},
    {'1': 'answer', '3': 2, '4': 1, '5': 9, '10': 'answer'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'answer_type', '3': 4, '4': 1, '5': 9, '10': 'answerType'},
    {'1': 'answer_canvas_elements', '3': 5, '4': 1, '5': 9, '10': 'answerCanvasElements'},
    {'1': 'answer_canvas_image', '3': 6, '4': 1, '5': 12, '10': 'answerCanvasImage'},
  ],
};

/// Descriptor for `GuideQuestion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guideQuestionDescriptor = $convert.base64Decode(
    'Cg1HdWlkZVF1ZXN0aW9uEhoKCHF1ZXN0aW9uGAEgASgJUghxdWVzdGlvbhIWCgZhbnN3ZXIYAi'
    'ABKAlSBmFuc3dlchISCgR0eXBlGAMgASgJUgR0eXBlEh8KC2Fuc3dlcl90eXBlGAQgASgJUgph'
    'bnN3ZXJUeXBlEjQKFmFuc3dlcl9jYW52YXNfZWxlbWVudHMYBSABKAlSFGFuc3dlckNhbnZhc0'
    'VsZW1lbnRzEi4KE2Fuc3dlcl9jYW52YXNfaW1hZ2UYBiABKAxSEWFuc3dlckNhbnZhc0ltYWdl');

