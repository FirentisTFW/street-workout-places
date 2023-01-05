// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_spot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutSpotModel {
  Address? get address => throw _privateConstructorUsedError;
  MapPosition? get coordinates => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Equipment> get equipment => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Surface? get surface => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutSpotModelCopyWith<WorkoutSpotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSpotModelCopyWith<$Res> {
  factory $WorkoutSpotModelCopyWith(
          WorkoutSpotModel value, $Res Function(WorkoutSpotModel) then) =
      _$WorkoutSpotModelCopyWithImpl<$Res, WorkoutSpotModel>;
  @useResult
  $Res call(
      {Address? address,
      MapPosition? coordinates,
      String? description,
      List<Equipment> equipment,
      List<String> images,
      String? name,
      Surface? surface});

  $AddressCopyWith<$Res>? get address;
  $MapPositionCopyWith<$Res>? get coordinates;
}

/// @nodoc
class _$WorkoutSpotModelCopyWithImpl<$Res, $Val extends WorkoutSpotModel>
    implements $WorkoutSpotModelCopyWith<$Res> {
  _$WorkoutSpotModelCopyWithImpl(this._value, this._then);

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
    Object? equipment = null,
    Object? images = null,
    Object? name = freezed,
    Object? surface = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as MapPosition?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<Equipment>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
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
abstract class _$$_WorkoutSpotModelCopyWith<$Res>
    implements $WorkoutSpotModelCopyWith<$Res> {
  factory _$$_WorkoutSpotModelCopyWith(
          _$_WorkoutSpotModel value, $Res Function(_$_WorkoutSpotModel) then) =
      __$$_WorkoutSpotModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Address? address,
      MapPosition? coordinates,
      String? description,
      List<Equipment> equipment,
      List<String> images,
      String? name,
      Surface? surface});

  @override
  $AddressCopyWith<$Res>? get address;
  @override
  $MapPositionCopyWith<$Res>? get coordinates;
}

/// @nodoc
class __$$_WorkoutSpotModelCopyWithImpl<$Res>
    extends _$WorkoutSpotModelCopyWithImpl<$Res, _$_WorkoutSpotModel>
    implements _$$_WorkoutSpotModelCopyWith<$Res> {
  __$$_WorkoutSpotModelCopyWithImpl(
      _$_WorkoutSpotModel _value, $Res Function(_$_WorkoutSpotModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? coordinates = freezed,
    Object? description = freezed,
    Object? equipment = null,
    Object? images = null,
    Object? name = freezed,
    Object? surface = freezed,
  }) {
    return _then(_$_WorkoutSpotModel(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as MapPosition?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      equipment: null == equipment
          ? _value._equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as List<Equipment>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
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

class _$_WorkoutSpotModel extends _WorkoutSpotModel {
  const _$_WorkoutSpotModel(
      {this.address,
      this.coordinates,
      this.description,
      final List<Equipment> equipment = const [],
      final List<String> images = const [],
      this.name,
      this.surface})
      : _equipment = equipment,
        _images = images,
        super._();

  @override
  final Address? address;
  @override
  final MapPosition? coordinates;
  @override
  final String? description;
  final List<Equipment> _equipment;
  @override
  @JsonKey()
  List<Equipment> get equipment {
    if (_equipment is EqualUnmodifiableListView) return _equipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipment);
  }

  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String? name;
  @override
  final Surface? surface;

  @override
  String toString() {
    return 'WorkoutSpotModel(address: $address, coordinates: $coordinates, description: $description, equipment: $equipment, images: $images, name: $name, surface: $surface)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutSpotModel &&
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
  _$$_WorkoutSpotModelCopyWith<_$_WorkoutSpotModel> get copyWith =>
      __$$_WorkoutSpotModelCopyWithImpl<_$_WorkoutSpotModel>(this, _$identity);
}

abstract class _WorkoutSpotModel extends WorkoutSpotModel {
  const factory _WorkoutSpotModel(
      {final Address? address,
      final MapPosition? coordinates,
      final String? description,
      final List<Equipment> equipment,
      final List<String> images,
      final String? name,
      final Surface? surface}) = _$_WorkoutSpotModel;
  const _WorkoutSpotModel._() : super._();

  @override
  Address? get address;
  @override
  MapPosition? get coordinates;
  @override
  String? get description;
  @override
  List<Equipment> get equipment;
  @override
  List<String> get images;
  @override
  String? get name;
  @override
  Surface? get surface;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutSpotModelCopyWith<_$_WorkoutSpotModel> get copyWith =>
      throw _privateConstructorUsedError;
}
