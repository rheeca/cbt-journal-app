//
//  Generated code. Do not modify.
//  source: goal.proto
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

import 'goal.pb.dart' as $0;

export 'goal.pb.dart';

@$pb.GrpcServiceName('journal.GoalService')
class GoalServiceClient extends $grpc.Client {
  static final _$readGoals = $grpc.ClientMethod<$0.ReadGoalsRequest, $0.ReadGoalsResponse>(
      '/journal.GoalService/ReadGoals',
      ($0.ReadGoalsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReadGoalsResponse.fromBuffer(value));
  static final _$writeGoals = $grpc.ClientMethod<$0.WriteGoalsRequest, $0.WriteGoalsResponse>(
      '/journal.GoalService/WriteGoals',
      ($0.WriteGoalsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.WriteGoalsResponse.fromBuffer(value));
  static final _$deleteGoals = $grpc.ClientMethod<$0.DeleteGoalsRequest, $0.DeleteGoalsResponse>(
      '/journal.GoalService/DeleteGoals',
      ($0.DeleteGoalsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteGoalsResponse.fromBuffer(value));

  GoalServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ReadGoalsResponse> readGoals($0.ReadGoalsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readGoals, request, options: options);
  }

  $grpc.ResponseFuture<$0.WriteGoalsResponse> writeGoals($0.WriteGoalsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeGoals, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteGoalsResponse> deleteGoals($0.DeleteGoalsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteGoals, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.GoalService')
abstract class GoalServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.GoalService';

  GoalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ReadGoalsRequest, $0.ReadGoalsResponse>(
        'ReadGoals',
        readGoals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReadGoalsRequest.fromBuffer(value),
        ($0.ReadGoalsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WriteGoalsRequest, $0.WriteGoalsResponse>(
        'WriteGoals',
        writeGoals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WriteGoalsRequest.fromBuffer(value),
        ($0.WriteGoalsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteGoalsRequest, $0.DeleteGoalsResponse>(
        'DeleteGoals',
        deleteGoals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteGoalsRequest.fromBuffer(value),
        ($0.DeleteGoalsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ReadGoalsResponse> readGoals_Pre($grpc.ServiceCall $call, $async.Future<$0.ReadGoalsRequest> $request) async {
    return readGoals($call, await $request);
  }

  $async.Future<$0.WriteGoalsResponse> writeGoals_Pre($grpc.ServiceCall $call, $async.Future<$0.WriteGoalsRequest> $request) async {
    return writeGoals($call, await $request);
  }

  $async.Future<$0.DeleteGoalsResponse> deleteGoals_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteGoalsRequest> $request) async {
    return deleteGoals($call, await $request);
  }

  $async.Future<$0.ReadGoalsResponse> readGoals($grpc.ServiceCall call, $0.ReadGoalsRequest request);
  $async.Future<$0.WriteGoalsResponse> writeGoals($grpc.ServiceCall call, $0.WriteGoalsRequest request);
  $async.Future<$0.DeleteGoalsResponse> deleteGoals($grpc.ServiceCall call, $0.DeleteGoalsRequest request);
}
