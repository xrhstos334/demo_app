//
//  Generated code. Do not modify.
//  source: service.proto
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

import 'location.pb.dart' as $1;
import 'weather.pb.dart' as $0;

export 'service.pb.dart';

@$pb.GrpcServiceName('weather.WeatherService')
class WeatherServiceClient extends $grpc.Client {
  static final _$current = $grpc.ClientMethod<$0.RequestCurrent, $0.SendCurrent>(
      '/weather.WeatherService/Current',
      ($0.RequestCurrent value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendCurrent.fromBuffer(value));
  static final _$fiveDay = $grpc.ClientMethod<$0.RequestFiveDay, $0.SendFiveDay>(
      '/weather.WeatherService/FiveDay',
      ($0.RequestFiveDay value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendFiveDay.fromBuffer(value));
  static final _$location = $grpc.ClientMethod<$1.RequestLocation, $1.SendLocation>(
      '/weather.WeatherService/Location',
      ($1.RequestLocation value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SendLocation.fromBuffer(value));

  WeatherServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SendCurrent> current($0.RequestCurrent request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$current, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendFiveDay> fiveDay($0.RequestFiveDay request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fiveDay, request, options: options);
  }

  $grpc.ResponseFuture<$1.SendLocation> location($1.RequestLocation request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$location, request, options: options);
  }
}

@$pb.GrpcServiceName('weather.WeatherService')
abstract class WeatherServiceBase extends $grpc.Service {
  $core.String get $name => 'weather.WeatherService';

  WeatherServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RequestCurrent, $0.SendCurrent>(
        'Current',
        current_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestCurrent.fromBuffer(value),
        ($0.SendCurrent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestFiveDay, $0.SendFiveDay>(
        'FiveDay',
        fiveDay_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestFiveDay.fromBuffer(value),
        ($0.SendFiveDay value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestLocation, $1.SendLocation>(
        'Location',
        location_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RequestLocation.fromBuffer(value),
        ($1.SendLocation value) => value.writeToBuffer()));
  }

  $async.Future<$0.SendCurrent> current_Pre($grpc.ServiceCall $call, $async.Future<$0.RequestCurrent> $request) async {
    return current($call, await $request);
  }

  $async.Future<$0.SendFiveDay> fiveDay_Pre($grpc.ServiceCall $call, $async.Future<$0.RequestFiveDay> $request) async {
    return fiveDay($call, await $request);
  }

  $async.Future<$1.SendLocation> location_Pre($grpc.ServiceCall $call, $async.Future<$1.RequestLocation> $request) async {
    return location($call, await $request);
  }

  $async.Future<$0.SendCurrent> current($grpc.ServiceCall call, $0.RequestCurrent request);
  $async.Future<$0.SendFiveDay> fiveDay($grpc.ServiceCall call, $0.RequestFiveDay request);
  $async.Future<$1.SendLocation> location($grpc.ServiceCall call, $1.RequestLocation request);
}
