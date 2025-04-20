//
//  Generated code. Do not modify.
//  source: goal_checkin.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readGoalCheckInsRequestDescriptor instead')
const ReadGoalCheckInsRequest$json = {
  '1': 'ReadGoalCheckInsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'last_synced', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastSynced'},
  ],
};

/// Descriptor for `ReadGoalCheckInsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readGoalCheckInsRequestDescriptor = $convert.base64Decode(
    'ChdSZWFkR29hbENoZWNrSW5zUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSOwoLbG'
    'FzdF9zeW5jZWQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgpsYXN0U3luY2Vk');

@$core.Deprecated('Use readGoalCheckInsResponseDescriptor instead')
const ReadGoalCheckInsResponse$json = {
  '1': 'ReadGoalCheckInsResponse',
  '2': [
    {'1': 'goalCheckIns', '3': 1, '4': 3, '5': 11, '6': '.journal.GoalCheckIn', '10': 'goalCheckIns'},
  ],
};

/// Descriptor for `ReadGoalCheckInsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readGoalCheckInsResponseDescriptor = $convert.base64Decode(
    'ChhSZWFkR29hbENoZWNrSW5zUmVzcG9uc2USOAoMZ29hbENoZWNrSW5zGAEgAygLMhQuam91cm'
    '5hbC5Hb2FsQ2hlY2tJblIMZ29hbENoZWNrSW5z');

@$core.Deprecated('Use writeGoalCheckInsRequestDescriptor instead')
const WriteGoalCheckInsRequest$json = {
  '1': 'WriteGoalCheckInsRequest',
  '2': [
    {'1': 'goalCheckIns', '3': 1, '4': 3, '5': 11, '6': '.journal.GoalCheckIn', '10': 'goalCheckIns'},
  ],
};

/// Descriptor for `WriteGoalCheckInsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeGoalCheckInsRequestDescriptor = $convert.base64Decode(
    'ChhXcml0ZUdvYWxDaGVja0luc1JlcXVlc3QSOAoMZ29hbENoZWNrSW5zGAEgAygLMhQuam91cm'
    '5hbC5Hb2FsQ2hlY2tJblIMZ29hbENoZWNrSW5z');

@$core.Deprecated('Use writeGoalCheckInsResponseDescriptor instead')
const WriteGoalCheckInsResponse$json = {
  '1': 'WriteGoalCheckInsResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `WriteGoalCheckInsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeGoalCheckInsResponseDescriptor = $convert.base64Decode(
    'ChlXcml0ZUdvYWxDaGVja0luc1Jlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEiMKDW'
    'Vycm9yX21lc3NhZ2UYAiABKAlSDGVycm9yTWVzc2FnZQ==');

@$core.Deprecated('Use goalCheckInDescriptor instead')
const GoalCheckIn$json = {
  '1': 'GoalCheckIn',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'date', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    {'1': 'goals', '3': 3, '4': 3, '5': 9, '10': 'goals'},
    {'1': 'updated_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'is_deleted', '3': 5, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
};

/// Descriptor for `GoalCheckIn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List goalCheckInDescriptor = $convert.base64Decode(
    'CgtHb2FsQ2hlY2tJbhIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSLgoEZGF0ZRgCIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBGRhdGUSFAoFZ29hbHMYAyADKAlSBWdvYWxzEjkK'
    'CnVwZGF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQX'
    'QSHQoKaXNfZGVsZXRlZBgFIAEoCFIJaXNEZWxldGVk');

