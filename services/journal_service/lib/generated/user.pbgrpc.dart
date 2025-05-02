//
//  Generated code. Do not modify.
//  source: user.proto
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

import 'user.pb.dart' as $5;

export 'user.pb.dart';

@$pb.GrpcServiceName('journal.UserService')
class UserServiceClient extends $grpc.Client {
  static final _$readUsers = $grpc.ClientMethod<$5.ReadUsersRequest, $5.ReadUsersResponse>(
      '/journal.UserService/ReadUsers',
      ($5.ReadUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ReadUsersResponse.fromBuffer(value));
  static final _$writeUsers = $grpc.ClientMethod<$5.WriteUsersRequest, $5.WriteUsersResponse>(
      '/journal.UserService/WriteUsers',
      ($5.WriteUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.WriteUsersResponse.fromBuffer(value));
  static final _$deleteUsers = $grpc.ClientMethod<$5.DeleteUsersRequest, $5.DeleteUsersResponse>(
      '/journal.UserService/DeleteUsers',
      ($5.DeleteUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.DeleteUsersResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$5.ReadUsersResponse> readUsers($5.ReadUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readUsers, request, options: options);
  }

  $grpc.ResponseFuture<$5.WriteUsersResponse> writeUsers($5.WriteUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeUsers, request, options: options);
  }

  $grpc.ResponseFuture<$5.DeleteUsersResponse> deleteUsers($5.DeleteUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUsers, request, options: options);
  }
}

@$pb.GrpcServiceName('journal.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'journal.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.ReadUsersRequest, $5.ReadUsersResponse>(
        'ReadUsers',
        readUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ReadUsersRequest.fromBuffer(value),
        ($5.ReadUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.WriteUsersRequest, $5.WriteUsersResponse>(
        'WriteUsers',
        writeUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.WriteUsersRequest.fromBuffer(value),
        ($5.WriteUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.DeleteUsersRequest, $5.DeleteUsersResponse>(
        'DeleteUsers',
        deleteUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.DeleteUsersRequest.fromBuffer(value),
        ($5.DeleteUsersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$5.ReadUsersResponse> readUsers_Pre($grpc.ServiceCall $call, $async.Future<$5.ReadUsersRequest> $request) async {
    return readUsers($call, await $request);
  }

  $async.Future<$5.WriteUsersResponse> writeUsers_Pre($grpc.ServiceCall $call, $async.Future<$5.WriteUsersRequest> $request) async {
    return writeUsers($call, await $request);
  }

  $async.Future<$5.DeleteUsersResponse> deleteUsers_Pre($grpc.ServiceCall $call, $async.Future<$5.DeleteUsersRequest> $request) async {
    return deleteUsers($call, await $request);
  }

  $async.Future<$5.ReadUsersResponse> readUsers($grpc.ServiceCall call, $5.ReadUsersRequest request);
  $async.Future<$5.WriteUsersResponse> writeUsers($grpc.ServiceCall call, $5.WriteUsersRequest request);
  $async.Future<$5.DeleteUsersResponse> deleteUsers($grpc.ServiceCall call, $5.DeleteUsersRequest request);
}
