//
//  Generated code. Do not modify.
//  source: device.proto
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

import 'device.pb.dart' as $0;

export 'device.pb.dart';

@$pb.GrpcServiceName('journal.DeviceService')
class DeviceServiceClient extends $grpc.Client {
  static final _$sync = $grpc.ClientMethod<$0.SyncRequest, $0.SyncResponse>(
      '/journal.DeviceService/Sync',
      ($0.SyncRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SyncResponse.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$0.LogoutRequest, $0.LogoutResponse>(
      '/journal.DeviceService/Logout',
      ($0.LogoutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LogoutResponse.fromBuffer(value));

  DeviceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.SyncResponse> sync($0.SyncRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sync, request, options: options);
  }

  $grpc.ResponseFuture<$0.LogoutResponse> logout($0.LogoutRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.DeviceService')
abstract class DeviceServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.DeviceService';

  DeviceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SyncRequest, $0.SyncResponse>(
        'Sync',
        sync_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SyncRequest.fromBuffer(value),
        ($0.SyncResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogoutRequest, $0.LogoutResponse>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutRequest.fromBuffer(value),
        ($0.LogoutResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SyncResponse> sync_Pre($grpc.ServiceCall $call, $async.Future<$0.SyncRequest> $request) async {
    return sync($call, await $request);
  }

  $async.Future<$0.LogoutResponse> logout_Pre($grpc.ServiceCall $call, $async.Future<$0.LogoutRequest> $request) async {
    return logout($call, await $request);
  }

  $async.Future<$0.SyncResponse> sync($grpc.ServiceCall call, $0.SyncRequest request);
  $async.Future<$0.LogoutResponse> logout($grpc.ServiceCall call, $0.LogoutRequest request);
}
