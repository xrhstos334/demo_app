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

/// Sub-message used by Current & Extended to specify preferred units
/// If unspecified, results will default to standard (temperature in Kelvin)
class Units extends $pb.ProtobufEnum {
  static const Units UNITS_UNSPECIFIED = Units._(0, _omitEnumNames ? '' : 'UNITS_UNSPECIFIED');
  static const Units UNITS_STANDARD = Units._(1, _omitEnumNames ? '' : 'UNITS_STANDARD');
  static const Units UNITS_METRIC = Units._(2, _omitEnumNames ? '' : 'UNITS_METRIC');
  static const Units UNITS_IMPERIAL = Units._(3, _omitEnumNames ? '' : 'UNITS_IMPERIAL');

  static const $core.List<Units> values = <Units> [
    UNITS_UNSPECIFIED,
    UNITS_STANDARD,
    UNITS_METRIC,
    UNITS_IMPERIAL,
  ];

  static final $core.Map<$core.int, Units> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Units? valueOf($core.int value) => _byValue[value];

  const Units._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
