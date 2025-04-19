//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readUsersRequestDescriptor instead')
const ReadUsersRequest$json = {
  '1': 'ReadUsersRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `ReadUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readUsersRequestDescriptor = $convert.base64Decode(
    'ChBSZWFkVXNlcnNSZXF1ZXN0EhAKA2lkcxgBIAMoCVIDaWRz');

@$core.Deprecated('Use readUsersResponseDescriptor instead')
const ReadUsersResponse$json = {
  '1': 'ReadUsersResponse',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.journal.User', '10': 'users'},
  ],
};

/// Descriptor for `ReadUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readUsersResponseDescriptor = $convert.base64Decode(
    'ChFSZWFkVXNlcnNSZXNwb25zZRIjCgV1c2VycxgBIAMoCzINLmpvdXJuYWwuVXNlclIFdXNlcn'
    'M=');

@$core.Deprecated('Use writeUsersRequestDescriptor instead')
const WriteUsersRequest$json = {
  '1': 'WriteUsersRequest',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.journal.User', '10': 'users'},
  ],
};

/// Descriptor for `WriteUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeUsersRequestDescriptor = $convert.base64Decode(
    'ChFXcml0ZVVzZXJzUmVxdWVzdBIjCgV1c2VycxgBIAMoCzINLmpvdXJuYWwuVXNlclIFdXNlcn'
    'M=');

@$core.Deprecated('Use writeUsersResponseDescriptor instead')
const WriteUsersResponse$json = {
  '1': 'WriteUsersResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `WriteUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeUsersResponseDescriptor = $convert.base64Decode(
    'ChJXcml0ZVVzZXJzUmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSIwoNZXJyb3JfbW'
    'Vzc2FnZRgCIAEoCVIMZXJyb3JNZXNzYWdl');

@$core.Deprecated('Use deleteUsersRequestDescriptor instead')
const DeleteUsersRequest$json = {
  '1': 'DeleteUsersRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `DeleteUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUsersRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVVc2Vyc1JlcXVlc3QSEAoDaWRzGAEgAygJUgNpZHM=');

@$core.Deprecated('Use deleteUsersResponseDescriptor instead')
const DeleteUsersResponse$json = {
  '1': 'DeleteUsersResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `DeleteUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUsersResponseDescriptor = $convert.base64Decode(
    'ChNEZWxldGVVc2Vyc1Jlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEiMKDWVycm9yX2'
    '1lc3NhZ2UYAiABKAlSDGVycm9yTWVzc2FnZQ==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'display_name', '3': 4, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'updated_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'is_deleted', '3': 6, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIUCgVlbWFpbBgCIAEoCVIFZW1haWwSOQoKY3JlYXRlZF'
    '9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBIhCgxkaXNw'
    'bGF5X25hbWUYBCABKAlSC2Rpc3BsYXlOYW1lEjkKCnVwZGF0ZWRfYXQYBSABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSHQoKaXNfZGVsZXRlZBgGIAEoCFIJaXNE'
    'ZWxldGVk');

