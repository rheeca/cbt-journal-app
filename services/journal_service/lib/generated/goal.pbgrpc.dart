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

import 'goal.pb.dart' as $1;

export 'goal.pb.dart';

@$pb.GrpcServiceName('journal.GoalService')
class GoalServiceClient extends $grpc.Client {
  static final _$readGoals = $grpc.ClientMethod<$1.ReadGoalsRequest, $1.ReadGoalsResponse>(
      '/journal.GoalService/ReadGoals',
      ($1.ReadGoalsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ReadGoalsResponse.fromBuffer(value));
  static final _$writeGoals = $grpc.ClientMethod<$1.WriteGoalsRequest, $1.WriteGoalsResponse>(
      '/journal.GoalService/WriteGoals',
      ($1.WriteGoalsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.WriteGoalsResponse.fromBuffer(value));
  static final _$deleteGoals = $grpc.ClientMethod<$1.DeleteGoalsRequest, $1.DeleteGoalsResponse>(
      '/journal.GoalService/DeleteGoals',
      ($1.DeleteGoalsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DeleteGoalsResponse.fromBuffer(value));

  GoalServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.ReadGoalsResponse> readGoals($1.ReadGoalsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readGoals, request, options: options);
  }

  $grpc.ResponseFuture<$1.WriteGoalsResponse> writeGoals($1.WriteGoalsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeGoals, request, options: options);
  }

  $grpc.ResponseFuture<$1.DeleteGoalsResponse> deleteGoals($1.DeleteGoalsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteGoals, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.GoalService')
abstract class GoalServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.GoalService';

  GoalServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.ReadGoalsRequest, $1.ReadGoalsResponse>(
        'ReadGoals',
        readGoals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ReadGoalsRequest.fromBuffer(value),
        ($1.ReadGoalsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.WriteGoalsRequest, $1.WriteGoalsResponse>(
        'WriteGoals',
        writeGoals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.WriteGoalsRequest.fromBuffer(value),
        ($1.WriteGoalsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteGoalsRequest, $1.DeleteGoalsResponse>(
        'DeleteGoals',
        deleteGoals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteGoalsRequest.fromBuffer(value),
        ($1.DeleteGoalsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ReadGoalsResponse> readGoals_Pre($grpc.ServiceCall $call, $async.Future<$1.ReadGoalsRequest> $request) async {
    return readGoals($call, await $request);
  }

  $async.Future<$1.WriteGoalsResponse> writeGoals_Pre($grpc.ServiceCall $call, $async.Future<$1.WriteGoalsRequest> $request) async {
    return writeGoals($call, await $request);
  }

  $async.Future<$1.DeleteGoalsResponse> deleteGoals_Pre($grpc.ServiceCall $call, $async.Future<$1.DeleteGoalsRequest> $request) async {
    return deleteGoals($call, await $request);
  }

  $async.Future<$1.ReadGoalsResponse> readGoals($grpc.ServiceCall call, $1.ReadGoalsRequest request);
  $async.Future<$1.WriteGoalsResponse> writeGoals($grpc.ServiceCall call, $1.WriteGoalsRequest request);
  $async.Future<$1.DeleteGoalsResponse> deleteGoals($grpc.ServiceCall call, $1.DeleteGoalsRequest request);
}
