//
//  Generated code. Do not modify.
//  source: location.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'location.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'location.pbenum.dart';

/// Get the latitude and longitude for a given location
/// Commented parameters in the message definition are not implemeneted yet
/// location_type {LocationType} - name or value of the desired LocationType enum
/// location {OneOfLocation} - city name, zip code, or coordinates
class RequestLocation extends $pb.GeneratedMessage {
  factory RequestLocation({
    LocationType? locationType,
    OneOfLocation? location,
  }) {
    final $result = create();
    if (locationType != null) {
      $result.locationType = locationType;
    }
    if (location != null) {
      $result.location = location;
    }
    return $result;
  }
  RequestLocation._() : super();
  factory RequestLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'weather'), createEmptyInstance: create)
    ..e<LocationType>(1, _omitFieldNames ? '' : 'locationType', $pb.PbFieldType.OE, defaultOrMaker: LocationType.LOCATION_TYPE_UNSPECIFIED, valueOf: LocationType.valueOf, enumValues: LocationType.values)
    ..aOM<OneOfLocation>(2, _omitFieldNames ? '' : 'location', subBuilder: OneOfLocation.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestLocation clone() => RequestLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestLocation copyWith(void Function(RequestLocation) updates) => super.copyWith((message) => updates(message as RequestLocation)) as RequestLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestLocation create() => RequestLocation._();
  RequestLocation createEmptyInstance() => create();
  static $pb.PbList<RequestLocation> createRepeated() => $pb.PbList<RequestLocation>();
  @$core.pragma('dart2js:noInline')
  static RequestLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestLocation>(create);
  static RequestLocation? _defaultInstance;

  @$pb.TagNumber(1)
  LocationType get locationType => $_getN(0);
  @$pb.TagNumber(1)
  set locationType(LocationType v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationType() => $_clearField(1);

  @$pb.TagNumber(2)
  OneOfLocation get location => $_getN(1);
  @$pb.TagNumber(2)
  set location(OneOfLocation v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocation() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocation() => $_clearField(2);
  @$pb.TagNumber(2)
  OneOfLocation ensureLocation() => $_ensure(1);
}

/// Response to RequestLocation
class SendLocation extends $pb.GeneratedMessage {
  factory SendLocation({
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final $result = create();
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    return $result;
  }
  SendLocation._() : super();
  factory SendLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'weather'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendLocation clone() => SendLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendLocation copyWith(void Function(SendLocation) updates) => super.copyWith((message) => updates(message as SendLocation)) as SendLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendLocation create() => SendLocation._();
  SendLocation createEmptyInstance() => create();
  static $pb.PbList<SendLocation> createRepeated() => $pb.PbList<SendLocation>();
  @$core.pragma('dart2js:noInline')
  static SendLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendLocation>(create);
  static SendLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => $_clearField(2);
}

/// Sub-message for OneOfLocation
/// Used to specify actual coordinates for the desired location
class Coordinates extends $pb.GeneratedMessage {
  factory Coordinates({
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final $result = create();
    if (latitude != null) {
      $result.latitude = latitude;
    }
    if (longitude != null) {
      $result.longitude = longitude;
    }
    return $result;
  }
  Coordinates._() : super();
  factory Coordinates.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coordinates.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Coordinates', package: const $pb.PackageName(_omitMessageNames ? '' : 'weather'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'latitude', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'longitude', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Coordinates clone() => Coordinates()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Coordinates copyWith(void Function(Coordinates) updates) => super.copyWith((message) => updates(message as Coordinates)) as Coordinates;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Coordinates create() => Coordinates._();
  Coordinates createEmptyInstance() => create();
  static $pb.PbList<Coordinates> createRepeated() => $pb.PbList<Coordinates>();
  @$core.pragma('dart2js:noInline')
  static Coordinates getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Coordinates>(create);
  static Coordinates? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => $_clearField(2);
}

enum OneOfLocation_LocationId {
  city, 
  zipCode, 
  coords, 
  notSet
}

/// Sub-message for RequestLocation, RequestCurrent, and RequestFiveDay
/// Used to specify the desired location: city, zip code, or coordinates.
class OneOfLocation extends $pb.GeneratedMessage {
  factory OneOfLocation({
    $core.String? city,
    $core.String? zipCode,
    Coordinates? coords,
  }) {
    final $result = create();
    if (city != null) {
      $result.city = city;
    }
    if (zipCode != null) {
      $result.zipCode = zipCode;
    }
    if (coords != null) {
      $result.coords = coords;
    }
    return $result;
  }
  OneOfLocation._() : super();
  factory OneOfLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OneOfLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, OneOfLocation_LocationId> _OneOfLocation_LocationIdByTag = {
    1 : OneOfLocation_LocationId.city,
    2 : OneOfLocation_LocationId.zipCode,
    3 : OneOfLocation_LocationId.coords,
    0 : OneOfLocation_LocationId.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OneOfLocation', package: const $pb.PackageName(_omitMessageNames ? '' : 'weather'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'city')
    ..aOS(2, _omitFieldNames ? '' : 'zipCode')
    ..aOM<Coordinates>(3, _omitFieldNames ? '' : 'coords', subBuilder: Coordinates.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OneOfLocation clone() => OneOfLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OneOfLocation copyWith(void Function(OneOfLocation) updates) => super.copyWith((message) => updates(message as OneOfLocation)) as OneOfLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OneOfLocation create() => OneOfLocation._();
  OneOfLocation createEmptyInstance() => create();
  static $pb.PbList<OneOfLocation> createRepeated() => $pb.PbList<OneOfLocation>();
  @$core.pragma('dart2js:noInline')
  static OneOfLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OneOfLocation>(create);
  static OneOfLocation? _defaultInstance;

  OneOfLocation_LocationId whichLocationId() => _OneOfLocation_LocationIdByTag[$_whichOneof(0)]!;
  void clearLocationId() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get city => $_getSZ(0);
  @$pb.TagNumber(1)
  set city($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCity() => $_has(0);
  @$pb.TagNumber(1)
  void clearCity() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get zipCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set zipCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasZipCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearZipCode() => $_clearField(2);

  @$pb.TagNumber(3)
  Coordinates get coords => $_getN(2);
  @$pb.TagNumber(3)
  set coords(Coordinates v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCoords() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoords() => $_clearField(3);
  @$pb.TagNumber(3)
  Coordinates ensureCoords() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
