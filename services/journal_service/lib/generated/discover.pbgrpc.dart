//
//  Generated code. Do not modify.
//  source: discover.proto
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

import 'discover.pb.dart' as $4;

export 'discover.pb.dart';

@$pb.GrpcServiceName('journal.DiscoverService')
class DiscoverServiceClient extends $grpc.Client {
  static final _$readGuidedJournals = $grpc.ClientMethod<$4.ReadGuidedJournalsRequest, $4.ReadGuidedJournalsResponse>(
      '/journal.DiscoverService/ReadGuidedJournals',
      ($4.ReadGuidedJournalsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.ReadGuidedJournalsResponse.fromBuffer(value));

  DiscoverServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.ReadGuidedJournalsResponse> readGuidedJournals($4.ReadGuidedJournalsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readGuidedJournals, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.DiscoverService')
abstract class DiscoverServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.DiscoverService';

  DiscoverServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.ReadGuidedJournalsRequest, $4.ReadGuidedJournalsResponse>(
        'ReadGuidedJournals',
        readGuidedJournals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.ReadGuidedJournalsRequest.fromBuffer(value),
        ($4.ReadGuidedJournalsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.ReadGuidedJournalsResponse> readGuidedJournals_Pre($grpc.ServiceCall $call, $async.Future<$4.ReadGuidedJournalsRequest> $request) async {
    return readGuidedJournals($call, await $request);
  }

  $async.Future<$4.ReadGuidedJournalsResponse> readGuidedJournals($grpc.ServiceCall call, $4.ReadGuidedJournalsRequest request);
}
