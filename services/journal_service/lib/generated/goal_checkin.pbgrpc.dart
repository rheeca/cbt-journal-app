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

import 'goal_checkin.pb.dart' as $3;

export 'goal_checkin.pb.dart';

@$pb.GrpcServiceName('journal.GoalCheckInService')
class GoalCheckInServiceClient extends $grpc.Client {
  static final _$readGoalCheckIns = $grpc.ClientMethod<$3.ReadGoalCheckInsRequest, $3.ReadGoalCheckInsResponse>(
      '/journal.GoalCheckInService/ReadGoalCheckIns',
      ($3.ReadGoalCheckInsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.ReadGoalCheckInsResponse.fromBuffer(value));
  static final _$writeGoalCheckIns = $grpc.ClientMethod<$3.WriteGoalCheckInsRequest, $3.WriteGoalCheckInsResponse>(
      '/journal.GoalCheckInService/WriteGoalCheckIns',
      ($3.WriteGoalCheckInsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.WriteGoalCheckInsResponse.fromBuffer(value));

  GoalCheckInServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$3.ReadGoalCheckInsResponse> readGoalCheckIns($3.ReadGoalCheckInsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readGoalCheckIns, request, options: options);
  }

  $grpc.ResponseFuture<$3.WriteGoalCheckInsResponse> writeGoalCheckIns($3.WriteGoalCheckInsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeGoalCheckIns, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.GoalCheckInService')
abstract class GoalCheckInServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.GoalCheckInService';

  GoalCheckInServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.ReadGoalCheckInsRequest, $3.ReadGoalCheckInsResponse>(
        'ReadGoalCheckIns',
        readGoalCheckIns_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ReadGoalCheckInsRequest.fromBuffer(value),
        ($3.ReadGoalCheckInsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.WriteGoalCheckInsRequest, $3.WriteGoalCheckInsResponse>(
        'WriteGoalCheckIns',
        writeGoalCheckIns_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.WriteGoalCheckInsRequest.fromBuffer(value),
        ($3.WriteGoalCheckInsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.ReadGoalCheckInsResponse> readGoalCheckIns_Pre($grpc.ServiceCall $call, $async.Future<$3.ReadGoalCheckInsRequest> $request) async {
    return readGoalCheckIns($call, await $request);
  }

  $async.Future<$3.WriteGoalCheckInsResponse> writeGoalCheckIns_Pre($grpc.ServiceCall $call, $async.Future<$3.WriteGoalCheckInsRequest> $request) async {
    return writeGoalCheckIns($call, await $request);
  }

  $async.Future<$3.ReadGoalCheckInsResponse> readGoalCheckIns($grpc.ServiceCall call, $3.ReadGoalCheckInsRequest request);
  $async.Future<$3.WriteGoalCheckInsResponse> writeGoalCheckIns($grpc.ServiceCall call, $3.WriteGoalCheckInsRequest request);
}
