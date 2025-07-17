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

/// Enum to specify the location type for which data is needed.
/// Helps the API find info for the correct location. If unspecified, an
/// attept is still made. However, results may be inaccurate if city is used,
/// or fail entirely if zip code or coordinates are used.
class LocationType extends $pb.ProtobufEnum {
  static const LocationType LOCATION_TYPE_UNSPECIFIED = LocationType._(0, _omitEnumNames ? '' : 'LOCATION_TYPE_UNSPECIFIED');
  static const LocationType LOCATION_TYPE_CITY = LocationType._(1, _omitEnumNames ? '' : 'LOCATION_TYPE_CITY');
  static const LocationType LOCATION_TYPE_ZIP_CODE = LocationType._(2, _omitEnumNames ? '' : 'LOCATION_TYPE_ZIP_CODE');
  static const LocationType LOCATION_TYPE_COORDS = LocationType._(3, _omitEnumNames ? '' : 'LOCATION_TYPE_COORDS');

  static const $core.List<LocationType> values = <LocationType> [
    LOCATION_TYPE_UNSPECIFIED,
    LOCATION_TYPE_CITY,
    LOCATION_TYPE_ZIP_CODE,
    LOCATION_TYPE_COORDS,
  ];

  static final $core.Map<$core.int, LocationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LocationType? valueOf($core.int value) => _byValue[value];

  const LocationType._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
