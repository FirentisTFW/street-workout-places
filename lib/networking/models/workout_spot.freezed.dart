// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutSpot {
// TODO Equipment
  String? get address => throw _privateConstructorUsedError;
  MapPosition? get coordinates => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Equipment?>? get equipment => throw _privateConstructorUsedError;
  List<String?>? get images => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Surface? get surface => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutSpotCopyWith<WorkoutSpot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSpotCopyWith<$Res> {
  factory $WorkoutSpotCopyWith(
          WorkoutSpot value, $Res Function(WorkoutSpot) then) =
      _$WorkoutSpotCopyWithImpl<$Res, WorkoutSpot>;
  @useResult
  $Res call(
      {String? address,
      MapPosition? coordinates,
      String? description,
      List<Equipment?>? equipment,
      List<String?>? images,
      String? name,
      Surface? surface});

  $MapPositionCopyWith<$Res>? get coordinates;
}

/// @nodoc
class _$WorkoutSpotCopyWithImpl<$Res, $Val extends WorkoutSpot>
    implements $WorkoutSpotCopyWith<$Res> {
  _$WorkoutSpotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? coordinates = freezed,
    Object? description = freezed,
    Object? equipment = freezed,
    Object? images = freezed,
    Object? name = freezed,
    Object? surface = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as MapPosition?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment: freezed == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<Equipment?>?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surface: freezed == surface
          ? _value.surface
          : surface // ignore: cast_nullable_to_non_nullable
              as Surface?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MapPositionCopyWith<$Res>? get coordinates {
    if (_value.coordinates == null) {
      return null;
    }

    return $MapPositionCopyWith<$Res>(_value.coordinates!, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorkoutSpotCopyWith<$Res>
    implements $WorkoutSpotCopyWith<$Res> {
  factory _$$_WorkoutSpotCopyWith(
          _$_WorkoutSpot value, $Res Function(_$_WorkoutSpot) then) =
      __$$_WorkoutSpotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? address,
      MapPosition? coordinates,
      String? description,
      List<Equipment?>? equipment,
      List<String?>? images,
      String? name,
      Surface? surface});

  @override
  $MapPositionCopyWith<$Res>? get coordinates;
}

/// @nodoc
class __$$_WorkoutSpotCopyWithImpl<$Res>
    extends _$WorkoutSpotCopyWithImpl<$Res, _$_WorkoutSpot>
    implements _$$_WorkoutSpotCopyWith<$Res> {
  __$$_WorkoutSpotCopyWithImpl(
      _$_WorkoutSpot _value, $Res Function(_$_WorkoutSpot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? coordinates = freezed,
    Object? description = freezed,
    Object? equipment = freezed,
    Object? images = freezed,
    Object? name = freezed,
    Object? surface = freezed,
  }) {
    return _then(_$_WorkoutSpot(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as MapPosition?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment: freezed == equipment
          ? _value._equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<Equipment?>?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surface: freezed == surface
          ? _value.surface
          : surface // ignore: cast_nullable_to_non_nullable
              as Surface?,
    ));
  }
}

/// @nodoc

class _$_WorkoutSpot extends _WorkoutSpot {
  const _$_WorkoutSpot(
      {this.address,
      this.coordinates,
      this.description,
      final List<Equipment?>? equipment,
      final List<String?>? images,
      this.name,
      this.surface})
      : _equipment = equipment,
        _images = images,
        super._();

// TODO Equipment
  @override
  final String? address;
  @override
  final MapPosition? coordinates;
  @override
  final String? description;
  final List<Equipment?>? _equipment;
  @override
  List<Equipment?>? get equipment {
    final value = _equipment;
    if (value == null) return null;
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String?>? _images;
  @override
  List<String?>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;
  @override
  final Surface? surface;

  @override
  String toString() {
    return 'WorkoutSpot(address: $address, coordinates: $coordinates, description: $description, equipment: $equipment, images: $images, name: $name, surface: $surface)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutSpot &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._equipment, _equipment) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surface, surface) || other.surface == surface));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      coordinates,
      description,
      const DeepCollectionEquality().hash(_equipment),
      const DeepCollectionEquality().hash(_images),
      name,
      surface);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutSpotCopyWith<_$_WorkoutSpot> get copyWith =>
      __$$_WorkoutSpotCopyWithImpl<_$_WorkoutSpot>(this, _$identity);
}

abstract class _WorkoutSpot extends WorkoutSpot {
  const factory _WorkoutSpot(
      {final String? address,
      final MapPosition? coordinates,
      final String? description,
      final List<Equipment?>? equipment,
      final List<String?>? images,
      final String? name,
      final Surface? surface}) = _$_WorkoutSpot;
  const _WorkoutSpot._() : super._();

  @override // TODO Equipment
  String? get address;
  @override
  MapPosition? get coordinates;
  @override
  String? get description;
  @override
  List<Equipment?>? get equipment;
  @override
  List<String?>? get images;
  @override
  String? get name;
  @override
  Surface? get surface;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutSpotCopyWith<_$_WorkoutSpot> get copyWith =>
      throw _privateConstructorUsedError;
}
