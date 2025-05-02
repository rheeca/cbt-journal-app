//
//  Generated code. Do not modify.
//  source: discover.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readGuidedJournalsRequestDescriptor instead')
const ReadGuidedJournalsRequest$json = {
  '1': 'ReadGuidedJournalsRequest',
};

/// Descriptor for `ReadGuidedJournalsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readGuidedJournalsRequestDescriptor = $convert.base64Decode(
    'ChlSZWFkR3VpZGVkSm91cm5hbHNSZXF1ZXN0');

@$core.Deprecated('Use readGuidedJournalsResponseDescriptor instead')
const ReadGuidedJournalsResponse$json = {
  '1': 'ReadGuidedJournalsResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'guided_journals', '3': 3, '4': 3, '5': 11, '6': '.journal.GuidedJournal', '10': 'guidedJournals'},
  ],
};

/// Descriptor for `ReadGuidedJournalsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readGuidedJournalsResponseDescriptor = $convert.base64Decode(
    'ChpSZWFkR3VpZGVkSm91cm5hbHNSZXNwb25zZRIWCgZzdGF0dXMYASABKAVSBnN0YXR1cxIjCg'
    '1lcnJvcl9tZXNzYWdlGAIgASgJUgxlcnJvck1lc3NhZ2USPwoPZ3VpZGVkX2pvdXJuYWxzGAMg'
    'AygLMhYuam91cm5hbC5HdWlkZWRKb3VybmFsUg5ndWlkZWRKb3VybmFscw==');

@$core.Deprecated('Use guidedJournalDescriptor instead')
const GuidedJournal$json = {
  '1': 'GuidedJournal',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'guide_questions', '3': 3, '4': 3, '5': 9, '10': 'guideQuestions'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'journal_type', '3': 5, '4': 3, '5': 9, '10': 'journalType'},
  ],
};

/// Descriptor for `GuidedJournal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guidedJournalDescriptor = $convert.base64Decode(
    'Cg1HdWlkZWRKb3VybmFsEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSJw'
    'oPZ3VpZGVfcXVlc3Rpb25zGAMgAygJUg5ndWlkZVF1ZXN0aW9ucxIgCgtkZXNjcmlwdGlvbhgE'
    'IAEoCVILZGVzY3JpcHRpb24SIQoMam91cm5hbF90eXBlGAUgAygJUgtqb3VybmFsVHlwZQ==');

