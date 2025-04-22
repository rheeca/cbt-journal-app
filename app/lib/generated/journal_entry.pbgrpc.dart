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

import 'journal_entry.pb.dart' as $1;

export 'journal_entry.pb.dart';

@$pb.GrpcServiceName('journal.JournalEntryService')
class JournalEntryServiceClient extends $grpc.Client {
  static final _$readJournalEntries = $grpc.ClientMethod<$1.ReadJournalEntriesRequest, $1.ReadJournalEntriesResponse>(
      '/journal.JournalEntryService/ReadJournalEntries',
      ($1.ReadJournalEntriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ReadJournalEntriesResponse.fromBuffer(value));
  static final _$writeJournalEntries = $grpc.ClientMethod<$1.WriteJournalEntriesRequest, $1.WriteJournalEntriesResponse>(
      '/journal.JournalEntryService/WriteJournalEntries',
      ($1.WriteJournalEntriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.WriteJournalEntriesResponse.fromBuffer(value));
  static final _$deleteJournalEntries = $grpc.ClientMethod<$1.DeleteJournalEntriesRequest, $1.DeleteJournalEntriesResponse>(
      '/journal.JournalEntryService/DeleteJournalEntries',
      ($1.DeleteJournalEntriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DeleteJournalEntriesResponse.fromBuffer(value));

  JournalEntryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.ReadJournalEntriesResponse> readJournalEntries($1.ReadJournalEntriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readJournalEntries, request, options: options);
  }

  $grpc.ResponseFuture<$1.WriteJournalEntriesResponse> writeJournalEntries($1.WriteJournalEntriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeJournalEntries, request, options: options);
  }

  $grpc.ResponseFuture<$1.DeleteJournalEntriesResponse> deleteJournalEntries($1.DeleteJournalEntriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteJournalEntries, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.JournalEntryService')
abstract class JournalEntryServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.JournalEntryService';

  JournalEntryServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.ReadJournalEntriesRequest, $1.ReadJournalEntriesResponse>(
        'ReadJournalEntries',
        readJournalEntries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ReadJournalEntriesRequest.fromBuffer(value),
        ($1.ReadJournalEntriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.WriteJournalEntriesRequest, $1.WriteJournalEntriesResponse>(
        'WriteJournalEntries',
        writeJournalEntries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.WriteJournalEntriesRequest.fromBuffer(value),
        ($1.WriteJournalEntriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteJournalEntriesRequest, $1.DeleteJournalEntriesResponse>(
        'DeleteJournalEntries',
        deleteJournalEntries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteJournalEntriesRequest.fromBuffer(value),
        ($1.DeleteJournalEntriesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ReadJournalEntriesResponse> readJournalEntries_Pre($grpc.ServiceCall $call, $async.Future<$1.ReadJournalEntriesRequest> $request) async {
    return readJournalEntries($call, await $request);
  }

  $async.Future<$1.WriteJournalEntriesResponse> writeJournalEntries_Pre($grpc.ServiceCall $call, $async.Future<$1.WriteJournalEntriesRequest> $request) async {
    return writeJournalEntries($call, await $request);
  }

  $async.Future<$1.DeleteJournalEntriesResponse> deleteJournalEntries_Pre($grpc.ServiceCall $call, $async.Future<$1.DeleteJournalEntriesRequest> $request) async {
    return deleteJournalEntries($call, await $request);
  }

  $async.Future<$1.ReadJournalEntriesResponse> readJournalEntries($grpc.ServiceCall call, $1.ReadJournalEntriesRequest request);
  $async.Future<$1.WriteJournalEntriesResponse> writeJournalEntries($grpc.ServiceCall call, $1.WriteJournalEntriesRequest request);
  $async.Future<$1.DeleteJournalEntriesResponse> deleteJournalEntries($grpc.ServiceCall call, $1.DeleteJournalEntriesRequest request);
}
