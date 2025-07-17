//
//  Generated code. Do not modify.
//  source: weather.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'location.pb.dart' as $1;
import 'location.pbenum.dart' as $1;
import 'weather.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'weather.pbenum.dart';

/// Get the current forecast for a given location
/// location_type {LocationType} - name or value of the desired LocationType enum
/// units {Units} - name or value of the desired Units enum
/// location {OneOfLocation} - city name, zip code, or coordinates
class RequestCurrent extends $pb.GeneratedMessage {
  factory RequestCurrent({
    $1.LocationType? locationType,
    Units? units,
    $1.OneOfLocation? location,
  }) {
    final $result = create();
    if (locationType != null) {
      $result.locationType = locationType;
    }
    if (units != null) {
      $result.units = units;
    }
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }
  RequestCurrent._() : super();
  factory RequestCurrent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestCurrent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestCurrent', package: const $pb.PackageName(_omitMessageNames ? '' : 'weather'), createEmptyInstance: create)
    ..e<$1.LocationType>(1, _omitFieldNames ? '' : 'locationType', $pb.PbFieldType.OE, defaultOrMaker: $1.LocationType.LOCATION_TYPE_UNSPECIFIED, valueOf: $1.LocationType.valueOf, enumValues: $1.LocationType.values)
    ..e<Units>(2, _omitFieldNames ? '' : 'units', $pb.PbFieldType.OE, defaultOrMaker: Units.UNITS_UNSPECIFIED, valueOf: Units.valueOf, enumValues: Units.values)
    ..aOM<$1.OneOfLocation>(3, _omitFieldNames ? '' : 'location', subBuilder: $1.OneOfLocation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestCurrent clone() => RequestCurrent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestCurrent copyWith(void Function(RequestCurrent) updates) => super.copyWith((message) => updates(message as RequestCurrent)) as RequestCurrent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestCurrent create() => RequestCurrent._();
  RequestCurrent createEmptyInstance() => create();
  static $pb.PbList<RequestCurrent> createRepeated() => $pb.PbList<RequestCurrent>();
  @$core.pragma('dart2js:noInline')
  static RequestCurrent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestCurrent>(create);
  static RequestCurrent? _defaultInstance;

  @$pb.TagNumber(1)
  $1.LocationType get locationType => $_getN(0);
  @$pb.TagNumber(1)
  set locationType($1.LocationType v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationType() => $_clearField(1);

  @$pb.TagNumber(2)
  Units get units => $_getN(1);
  @$pb.TagNumber(2)
  set units(Units v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnits() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnits() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.OneOfLocation get location => $_getN(2);
  @$pb.TagNumber(3)
  set location($1.OneOfLocation v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocation() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocation() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.OneOfLocation ensureLocation() => $_ensure(2);
}

/// Response to RequestCurrent
class SendCurrent extends $pb.GeneratedMessage {
  factory SendCurrent({
    $core.String? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  SendCurrent._() : super();
  factory SendCurrent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendCurrent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendCurrent', package: const $pb.PackageName(_omitMessageNames ? '' : 'weather'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'payload')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendCurrent clone() => SendCurrent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendCurrent copyWith(void Function(SendCurrent) updates) => super.copyWith((message) => updates(message as SendCurrent)) as SendCurrent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendCurrent create() => SendCurrent._();
  SendCurrent createEmptyInstance() => create();
  static $pb.PbList<SendCurrent> createRepeated() => $pb.PbList<SendCurrent>();
  @$core.pragma('dart2js:noInline')
  static SendCurrent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendCurrent>(create);
  static SendCurrent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payload => $_getSZ(0);
  @$pb.TagNumber(1)
  set payload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => $_clearField(1);
}

/// Get the extended forecast for a given location up to 16 days in the future
/// location_type {LocationType} - name or value of the desired LocationType enum
/// units {Units} - name or value of the desired Units enum
/// location {OneOfLocation} - city name, zip code, or coordinates
class RequestFiveDay extends $pb.GeneratedMessage {
  factory RequestFiveDay({
    $1.LocationType? locationType,
    Units? units,
    $1.OneOfLocation? location,
  }) {
    final $result = create();
    if (locationType != null) {
      $result.locationType = locationType;
    }
    if (units != null) {
      $result.units = units;
    }
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }
  RequestFiveDay._() : super();
  factory RequestFiveDay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestFiveDay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestFiveDay', package: const $pb.PackageName(_omitMessageNames ? '' : 'weather'), createEmptyInstance: create)
    ..e<$1.LocationType>(1, _omitFieldNames ? '' : 'locationType', $pb.PbFieldType.OE, defaultOrMaker: $1.LocationType.LOCATION_TYPE_UNSPECIFIED, valueOf: $1.LocationType.valueOf, enumValues: $1.LocationType.values)
    ..e<Units>(2, _omitFieldNames ? '' : 'units', $pb.PbFieldType.OE, defaultOrMaker: Units.UNITS_UNSPECIFIED, valueOf: Units.valueOf, enumValues: Units.values)
    ..aOM<$1.OneOfLocation>(3, _omitFieldNames ? '' : 'location', subBuilder: $1.OneOfLocation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestFiveDay clone() => RequestFiveDay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestFiveDay copyWith(void Function(RequestFiveDay) updates) => super.copyWith((message) => updates(message as RequestFiveDay)) as RequestFiveDay;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestFiveDay create() => RequestFiveDay._();
  RequestFiveDay createEmptyInstance() => create();
  static $pb.PbList<RequestFiveDay> createRepeated() => $pb.PbList<RequestFiveDay>();
  @$core.pragma('dart2js:noInline')
  static RequestFiveDay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestFiveDay>(create);
  static RequestFiveDay? _defaultInstance;

  @$pb.TagNumber(1)
  $1.LocationType get locationType => $_getN(0);
  @$pb.TagNumber(1)
  set locationType($1.LocationType v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationType() => $_clearField(1);

  @$pb.TagNumber(2)
  Units get units => $_getN(1);
  @$pb.TagNumber(2)
  set units(Units v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnits() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnits() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.OneOfLocation get location => $_getN(2);
  @$pb.TagNumber(3)
  set location($1.OneOfLocation v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocation() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocation() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.OneOfLocation ensureLocation() => $_ensure(2);
}

/// Response to RequestExtended
class SendFiveDay extends $pb.GeneratedMessage {
  factory SendFiveDay({
    $core.String? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  SendFiveDay._() : super();
  factory SendFiveDay.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFiveDay.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendFiveDay', package: const $pb.PackageName(_omitMessageNames ? '' : 'weather'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'payload')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFiveDay clone() => SendFiveDay()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFiveDay copyWith(void Function(SendFiveDay) updates) => super.copyWith((message) => updates(message as SendFiveDay)) as SendFiveDay;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendFiveDay create() => SendFiveDay._();
  SendFiveDay createEmptyInstance() => create();
  static $pb.PbList<SendFiveDay> createRepeated() => $pb.PbList<SendFiveDay>();
  @$core.pragma('dart2js:noInline')
  static SendFiveDay getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFiveDay>(create);
  static SendFiveDay? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payload => $_getSZ(0);
  @$pb.TagNumber(1)
  set payload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => $_clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
