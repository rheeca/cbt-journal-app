//
//  Generated code. Do not modify.
//  source: goal_checkin.proto
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

import 'goal_checkin.pb.dart' as $2;

export 'goal_checkin.pb.dart';

@$pb.GrpcServiceName('journal.GoalCheckInService')
class GoalCheckInServiceClient extends $grpc.Client {
  static final _$readGoalCheckIns = $grpc.ClientMethod<$2.ReadGoalCheckInsRequest, $2.ReadGoalCheckInsResponse>(
      '/journal.GoalCheckInService/ReadGoalCheckIns',
      ($2.ReadGoalCheckInsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ReadGoalCheckInsResponse.fromBuffer(value));
  static final _$writeGoalCheckIns = $grpc.ClientMethod<$2.WriteGoalCheckInsRequest, $2.WriteGoalCheckInsResponse>(
      '/journal.GoalCheckInService/WriteGoalCheckIns',
      ($2.WriteGoalCheckInsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.WriteGoalCheckInsResponse.fromBuffer(value));
  static final _$deleteGoalCheckIns = $grpc.ClientMethod<$2.DeleteGoalCheckInsRequest, $2.DeleteGoalCheckInsResponse>(
      '/journal.GoalCheckInService/DeleteGoalCheckIns',
      ($2.DeleteGoalCheckInsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.DeleteGoalCheckInsResponse.fromBuffer(value));

  GoalCheckInServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.ReadGoalCheckInsResponse> readGoalCheckIns($2.ReadGoalCheckInsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readGoalCheckIns, request, options: options);
  }

  $grpc.ResponseFuture<$2.WriteGoalCheckInsResponse> writeGoalCheckIns($2.WriteGoalCheckInsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeGoalCheckIns, request, options: options);
  }

  $grpc.ResponseFuture<$2.DeleteGoalCheckInsResponse> deleteGoalCheckIns($2.DeleteGoalCheckInsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteGoalCheckIns, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.GoalCheckInService')
abstract class GoalCheckInServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.GoalCheckInService';

  GoalCheckInServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.ReadGoalCheckInsRequest, $2.ReadGoalCheckInsResponse>(
        'ReadGoalCheckIns',
        readGoalCheckIns_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ReadGoalCheckInsRequest.fromBuffer(value),
        ($2.ReadGoalCheckInsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.WriteGoalCheckInsRequest, $2.WriteGoalCheckInsResponse>(
        'WriteGoalCheckIns',
        writeGoalCheckIns_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.WriteGoalCheckInsRequest.fromBuffer(value),
        ($2.WriteGoalCheckInsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteGoalCheckInsRequest, $2.DeleteGoalCheckInsResponse>(
        'DeleteGoalCheckIns',
        deleteGoalCheckIns_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteGoalCheckInsRequest.fromBuffer(value),
        ($2.DeleteGoalCheckInsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.ReadGoalCheckInsResponse> readGoalCheckIns_Pre($grpc.ServiceCall $call, $async.Future<$2.ReadGoalCheckInsRequest> $request) async {
    return readGoalCheckIns($call, await $request);
  }

  $async.Future<$2.WriteGoalCheckInsResponse> writeGoalCheckIns_Pre($grpc.ServiceCall $call, $async.Future<$2.WriteGoalCheckInsRequest> $request) async {
    return writeGoalCheckIns($call, await $request);
  }

  $async.Future<$2.DeleteGoalCheckInsResponse> deleteGoalCheckIns_Pre($grpc.ServiceCall $call, $async.Future<$2.DeleteGoalCheckInsRequest> $request) async {
    return deleteGoalCheckIns($call, await $request);
  }

  $async.Future<$2.ReadGoalCheckInsResponse> readGoalCheckIns($grpc.ServiceCall call, $2.ReadGoalCheckInsRequest request);
  $async.Future<$2.WriteGoalCheckInsResponse> writeGoalCheckIns($grpc.ServiceCall call, $2.WriteGoalCheckInsRequest request);
  $async.Future<$2.DeleteGoalCheckInsResponse> deleteGoalCheckIns($grpc.ServiceCall call, $2.DeleteGoalCheckInsRequest request);
}
