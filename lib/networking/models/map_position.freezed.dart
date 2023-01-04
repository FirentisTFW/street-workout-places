// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapPosition {
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapPositionCopyWith<MapPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapPositionCopyWith<$Res> {
  factory $MapPositionCopyWith(
          MapPosition value, $Res Function(MapPosition) then) =
      _$MapPositionCopyWithImpl<$Res, MapPosition>;
  @useResult
  $Res call({double? lat, double? lng});
}

/// @nodoc
class _$MapPositionCopyWithImpl<$Res, $Val extends MapPosition>
    implements $MapPositionCopyWith<$Res> {
  _$MapPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapPositionCopyWith<$Res>
    implements $MapPositionCopyWith<$Res> {
  factory _$$_MapPositionCopyWith(
          _$_MapPosition value, $Res Function(_$_MapPosition) then) =
      __$$_MapPositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? lat, double? lng});
}

/// @nodoc
class __$$_MapPositionCopyWithImpl<$Res>
    extends _$MapPositionCopyWithImpl<$Res, _$_MapPosition>
    implements _$$_MapPositionCopyWith<$Res> {
  __$$_MapPositionCopyWithImpl(
      _$_MapPosition _value, $Res Function(_$_MapPosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_MapPosition(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_MapPosition extends _MapPosition {
  const _$_MapPosition({this.lat, this.lng}) : super._();

  @override
  final double? lat;
  @override
  final double? lng;

  @override
  String toString() {
    return 'MapPosition(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapPosition &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapPositionCopyWith<_$_MapPosition> get copyWith =>
      __$$_MapPositionCopyWithImpl<_$_MapPosition>(this, _$identity);
}

abstract class _MapPosition extends MapPosition {
  const factory _MapPosition({final double? lat, final double? lng}) =
      _$_MapPosition;
  const _MapPosition._() : super._();

  @override
  double? get lat;
  @override
  double? get lng;
  @override
  @JsonKey(ignore: true)
  _$$_MapPositionCopyWith<_$_MapPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
