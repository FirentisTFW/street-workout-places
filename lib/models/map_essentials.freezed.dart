// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_essentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapEssentials {
  MapPosition get initialCoordinates => throw _privateConstructorUsedError;
  double get maxZoom => throw _privateConstructorUsedError;
  double get minZoom => throw _privateConstructorUsedError;
  double get zoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapEssentialsCopyWith<MapEssentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapEssentialsCopyWith<$Res> {
  factory $MapEssentialsCopyWith(
          MapEssentials value, $Res Function(MapEssentials) then) =
      _$MapEssentialsCopyWithImpl<$Res, MapEssentials>;
  @useResult
  $Res call(
      {MapPosition initialCoordinates,
      double maxZoom,
      double minZoom,
      double zoom});

  $MapPositionCopyWith<$Res> get initialCoordinates;
}

/// @nodoc
class _$MapEssentialsCopyWithImpl<$Res, $Val extends MapEssentials>
    implements $MapEssentialsCopyWith<$Res> {
  _$MapEssentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialCoordinates = null,
    Object? maxZoom = null,
    Object? minZoom = null,
    Object? zoom = null,
  }) {
    return _then(_value.copyWith(
      initialCoordinates: null == initialCoordinates
          ? _value.initialCoordinates
          : initialCoordinates // ignore: cast_nullable_to_non_nullable
              as MapPosition,
      maxZoom: null == maxZoom
          ? _value.maxZoom
          : maxZoom // ignore: cast_nullable_to_non_nullable
              as double,
      minZoom: null == minZoom
          ? _value.minZoom
          : minZoom // ignore: cast_nullable_to_non_nullable
              as double,
      zoom: null == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MapPositionCopyWith<$Res> get initialCoordinates {
    return $MapPositionCopyWith<$Res>(_value.initialCoordinates, (value) {
      return _then(_value.copyWith(initialCoordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MapEssentialsCopyWith<$Res>
    implements $MapEssentialsCopyWith<$Res> {
  factory _$$_MapEssentialsCopyWith(
          _$_MapEssentials value, $Res Function(_$_MapEssentials) then) =
      __$$_MapEssentialsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MapPosition initialCoordinates,
      double maxZoom,
      double minZoom,
      double zoom});

  @override
  $MapPositionCopyWith<$Res> get initialCoordinates;
}

/// @nodoc
class __$$_MapEssentialsCopyWithImpl<$Res>
    extends _$MapEssentialsCopyWithImpl<$Res, _$_MapEssentials>
    implements _$$_MapEssentialsCopyWith<$Res> {
  __$$_MapEssentialsCopyWithImpl(
      _$_MapEssentials _value, $Res Function(_$_MapEssentials) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialCoordinates = null,
    Object? maxZoom = null,
    Object? minZoom = null,
    Object? zoom = null,
  }) {
    return _then(_$_MapEssentials(
      initialCoordinates: null == initialCoordinates
          ? _value.initialCoordinates
          : initialCoordinates // ignore: cast_nullable_to_non_nullable
              as MapPosition,
      maxZoom: null == maxZoom
          ? _value.maxZoom
          : maxZoom // ignore: cast_nullable_to_non_nullable
              as double,
      minZoom: null == minZoom
          ? _value.minZoom
          : minZoom // ignore: cast_nullable_to_non_nullable
              as double,
      zoom: null == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MapEssentials extends _MapEssentials {
  const _$_MapEssentials(
      {required this.initialCoordinates,
      required this.maxZoom,
      required this.minZoom,
      required this.zoom})
      : super._();

  @override
  final MapPosition initialCoordinates;
  @override
  final double maxZoom;
  @override
  final double minZoom;
  @override
  final double zoom;

  @override
  String toString() {
    return 'MapEssentials(initialCoordinates: $initialCoordinates, maxZoom: $maxZoom, minZoom: $minZoom, zoom: $zoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapEssentials &&
            (identical(other.initialCoordinates, initialCoordinates) ||
                other.initialCoordinates == initialCoordinates) &&
            (identical(other.maxZoom, maxZoom) || other.maxZoom == maxZoom) &&
            (identical(other.minZoom, minZoom) || other.minZoom == minZoom) &&
            (identical(other.zoom, zoom) || other.zoom == zoom));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, initialCoordinates, maxZoom, minZoom, zoom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapEssentialsCopyWith<_$_MapEssentials> get copyWith =>
      __$$_MapEssentialsCopyWithImpl<_$_MapEssentials>(this, _$identity);
}

abstract class _MapEssentials extends MapEssentials {
  const factory _MapEssentials(
      {required final MapPosition initialCoordinates,
      required final double maxZoom,
      required final double minZoom,
      required final double zoom}) = _$_MapEssentials;
  const _MapEssentials._() : super._();

  @override
  MapPosition get initialCoordinates;
  @override
  double get maxZoom;
  @override
  double get minZoom;
  @override
  double get zoom;
  @override
  @JsonKey(ignore: true)
  _$$_MapEssentialsCopyWith<_$_MapEssentials> get copyWith =>
      throw _privateConstructorUsedError;
}
