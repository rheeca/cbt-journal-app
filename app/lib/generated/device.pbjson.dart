//
//  Generated code. Do not modify.
//  source: device.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use syncRequestDescriptor instead')
const SyncRequest$json = {
  '1': 'SyncRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `SyncRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncRequestDescriptor = $convert.base64Decode(
    'CgtTeW5jUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklk');

@$core.Deprecated('Use syncResponseDescriptor instead')
const SyncResponse$json = {
  '1': 'SyncResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'deleted_goals', '3': 3, '4': 3, '5': 9, '10': 'deletedGoals'},
    {'1': 'deleted_journal_entries', '3': 4, '4': 3, '5': 9, '10': 'deletedJournalEntries'},
  ],
};

/// Descriptor for `SyncResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncResponseDescriptor = $convert.base64Decode(
    'CgxTeW5jUmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSIwoNZXJyb3JfbWVzc2FnZR'
    'gCIAEoCVIMZXJyb3JNZXNzYWdlEiMKDWRlbGV0ZWRfZ29hbHMYAyADKAlSDGRlbGV0ZWRHb2Fs'
    'cxI2ChdkZWxldGVkX2pvdXJuYWxfZW50cmllcxgEIAMoCVIVZGVsZXRlZEpvdXJuYWxFbnRyaW'
    'Vz');

@$core.Deprecated('Use logoutRequestDescriptor instead')
const LogoutRequest$json = {
  '1': 'LogoutRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `LogoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutRequestDescriptor = $convert.base64Decode(
    'Cg1Mb2dvdXRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySW'
    'Q=');

@$core.Deprecated('Use logoutResponseDescriptor instead')
const LogoutResponse$json = {
  '1': 'LogoutResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `LogoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutResponseDescriptor = $convert.base64Decode(
    'Cg5Mb2dvdXRSZXNwb25zZRIWCgZzdGF0dXMYASABKAVSBnN0YXR1cxIjCg1lcnJvcl9tZXNzYW'
    'dlGAIgASgJUgxlcnJvck1lc3NhZ2U=');

