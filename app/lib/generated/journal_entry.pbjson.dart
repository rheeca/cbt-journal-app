//
//  Generated code. Do not modify.
//  source: journal_entry.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readJournalEntriesRequestDescriptor instead')
const ReadJournalEntriesRequest$json = {
  '1': 'ReadJournalEntriesRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ReadJournalEntriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readJournalEntriesRequestDescriptor = $convert.base64Decode(
    'ChlSZWFkSm91cm5hbEVudHJpZXNSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use readJournalEntriesResponseDescriptor instead')
const ReadJournalEntriesResponse$json = {
  '1': 'ReadJournalEntriesResponse',
  '2': [
    {'1': 'journal_entries', '3': 1, '4': 3, '5': 11, '6': '.journal.JournalEntry', '10': 'journalEntries'},
  ],
};

/// Descriptor for `ReadJournalEntriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readJournalEntriesResponseDescriptor = $convert.base64Decode(
    'ChpSZWFkSm91cm5hbEVudHJpZXNSZXNwb25zZRI+Cg9qb3VybmFsX2VudHJpZXMYASADKAsyFS'
    '5qb3VybmFsLkpvdXJuYWxFbnRyeVIOam91cm5hbEVudHJpZXM=');

@$core.Deprecated('Use writeJournalEntriesRequestDescriptor instead')
const WriteJournalEntriesRequest$json = {
  '1': 'WriteJournalEntriesRequest',
  '2': [
    {'1': 'journal_entries', '3': 1, '4': 3, '5': 11, '6': '.journal.JournalEntry', '10': 'journalEntries'},
  ],
};

/// Descriptor for `WriteJournalEntriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeJournalEntriesRequestDescriptor = $convert.base64Decode(
    'ChpXcml0ZUpvdXJuYWxFbnRyaWVzUmVxdWVzdBI+Cg9qb3VybmFsX2VudHJpZXMYASADKAsyFS'
    '5qb3VybmFsLkpvdXJuYWxFbnRyeVIOam91cm5hbEVudHJpZXM=');

@$core.Deprecated('Use writeJournalEntriesResponseDescriptor instead')
const WriteJournalEntriesResponse$json = {
  '1': 'WriteJournalEntriesResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `WriteJournalEntriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeJournalEntriesResponseDescriptor = $convert.base64Decode(
    'ChtXcml0ZUpvdXJuYWxFbnRyaWVzUmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSIw'
    'oNZXJyb3JfbWVzc2FnZRgCIAEoCVIMZXJyb3JNZXNzYWdl');

@$core.Deprecated('Use deleteJournalEntriesRequestDescriptor instead')
const DeleteJournalEntriesRequest$json = {
  '1': 'DeleteJournalEntriesRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `DeleteJournalEntriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteJournalEntriesRequestDescriptor = $convert.base64Decode(
    'ChtEZWxldGVKb3VybmFsRW50cmllc1JlcXVlc3QSEAoDaWRzGAEgAygJUgNpZHM=');

@$core.Deprecated('Use deleteJournalEntriesResponseDescriptor instead')
const DeleteJournalEntriesResponse$json = {
  '1': 'DeleteJournalEntriesResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `DeleteJournalEntriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteJournalEntriesResponseDescriptor = $convert.base64Decode(
    'ChxEZWxldGVKb3VybmFsRW50cmllc1Jlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEi'
    'MKDWVycm9yX21lc3NhZ2UYAiABKAlSDGVycm9yTWVzc2FnZQ==');

@$core.Deprecated('Use journalEntryDescriptor instead')
const JournalEntry$json = {
  '1': 'JournalEntry',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'guided_journal', '3': 4, '4': 1, '5': 9, '10': 'guidedJournal'},
    {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 6, '4': 3, '5': 11, '6': '.journal.GuideQuestion', '10': 'content'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'is_deleted', '3': 8, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
};

/// Descriptor for `JournalEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List journalEntryDescriptor = $convert.base64Decode(
    'CgxKb3VybmFsRW50cnkSDgoCaWQYASABKAlSAmlkEhcKB3VzZXJfaWQYAiABKAlSBnVzZXJJZB'
    'I5CgpjcmVhdGVkX2F0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRl'
    'ZEF0EiUKDmd1aWRlZF9qb3VybmFsGAQgASgJUg1ndWlkZWRKb3VybmFsEhQKBXRpdGxlGAUgAS'
    'gJUgV0aXRsZRIwCgdjb250ZW50GAYgAygLMhYuam91cm5hbC5HdWlkZVF1ZXN0aW9uUgdjb250'
    'ZW50EjkKCnVwZGF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cG'
    'RhdGVkQXQSHQoKaXNfZGVsZXRlZBgIIAEoCFIJaXNEZWxldGVk');

