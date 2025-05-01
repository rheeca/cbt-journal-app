//
//  Generated code. Do not modify.
//  source: journal_entry.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'journal_entry.pb.dart' as $2;

export 'journal_entry.pb.dart';

@$pb.GrpcServiceName('journal.JournalEntryService')
class JournalEntryServiceClient extends $grpc.Client {
  static final _$readJournalEntries = $grpc.ClientMethod<$2.ReadJournalEntriesRequest, $2.ReadJournalEntriesResponse>(
      '/journal.JournalEntryService/ReadJournalEntries',
      ($2.ReadJournalEntriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ReadJournalEntriesResponse.fromBuffer(value));
  static final _$writeJournalEntries = $grpc.ClientMethod<$2.WriteJournalEntriesRequest, $2.WriteJournalEntriesResponse>(
      '/journal.JournalEntryService/WriteJournalEntries',
      ($2.WriteJournalEntriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.WriteJournalEntriesResponse.fromBuffer(value));
  static final _$deleteJournalEntries = $grpc.ClientMethod<$2.DeleteJournalEntriesRequest, $2.DeleteJournalEntriesResponse>(
      '/journal.JournalEntryService/DeleteJournalEntries',
      ($2.DeleteJournalEntriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.DeleteJournalEntriesResponse.fromBuffer(value));

  JournalEntryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.ReadJournalEntriesResponse> readJournalEntries($2.ReadJournalEntriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readJournalEntries, request, options: options);
  }

  $grpc.ResponseFuture<$2.WriteJournalEntriesResponse> writeJournalEntries($2.WriteJournalEntriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeJournalEntries, request, options: options);
  }

  $grpc.ResponseFuture<$2.DeleteJournalEntriesResponse> deleteJournalEntries($2.DeleteJournalEntriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteJournalEntries, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.JournalEntryService')
abstract class JournalEntryServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.JournalEntryService';

  JournalEntryServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ReadJournalEntriesRequest, $2.ReadJournalEntriesResponse>(
        'ReadJournalEntries',
        readJournalEntries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadJournalEntriesRequest.fromBuffer(value),
        ($2.ReadJournalEntriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.WriteJournalEntriesRequest, $2.WriteJournalEntriesResponse>(
        'WriteJournalEntries',
        writeJournalEntries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.WriteJournalEntriesRequest.fromBuffer(value),
        ($2.WriteJournalEntriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteJournalEntriesRequest, $2.DeleteJournalEntriesResponse>(
        'DeleteJournalEntries',
        deleteJournalEntries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteJournalEntriesRequest.fromBuffer(value),
        ($2.DeleteJournalEntriesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.ReadJournalEntriesResponse> readJournalEntries_Pre($grpc.ServiceCall $call, $async.Future<$2.ReadJournalEntriesRequest> $request) async {
    return readJournalEntries($call, await $request);
  }

  $async.Future<$2.WriteJournalEntriesResponse> writeJournalEntries_Pre($grpc.ServiceCall $call, $async.Future<$2.WriteJournalEntriesRequest> $request) async {
    return writeJournalEntries($call, await $request);
  }

  $async.Future<$2.DeleteJournalEntriesResponse> deleteJournalEntries_Pre($grpc.ServiceCall $call, $async.Future<$2.DeleteJournalEntriesRequest> $request) async {
    return deleteJournalEntries($call, await $request);
  }

  $async.Future<$2.ReadJournalEntriesResponse> readJournalEntries($grpc.ServiceCall call, $2.ReadJournalEntriesRequest request);
  $async.Future<$2.WriteJournalEntriesResponse> writeJournalEntries($grpc.ServiceCall call, $2.WriteJournalEntriesRequest request);
  $async.Future<$2.DeleteJournalEntriesResponse> deleteJournalEntries($grpc.ServiceCall call, $2.DeleteJournalEntriesRequest request);
}
