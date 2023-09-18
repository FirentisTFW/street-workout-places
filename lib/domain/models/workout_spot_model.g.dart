// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_spot_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutSpotModelCWProxy {
  WorkoutSpotModel address(Address? address);

  WorkoutSpotModel coordinates(MapPosition? coordinates);

  WorkoutSpotModel description(String? description);

  WorkoutSpotModel distanceFromUserInKm(double? distanceFromUserInKm);

  WorkoutSpotModel equipment(List<Equipment> equipment);

  WorkoutSpotModel id(int? id);

  WorkoutSpotModel images(List<String> images);

  WorkoutSpotModel name(String? name);

  WorkoutSpotModel reviews(List<Review> reviews);

  WorkoutSpotModel size(WorkoutSpotSize? size);

  WorkoutSpotModel surface(Surface? surface);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkoutSpotModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkoutSpotModel(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkoutSpotModel call({
    Address? address,
    MapPosition? coordinates,
    String? description,
    double? distanceFromUserInKm,
    List<Equipment>? equipment,
    int? id,
    List<String>? images,
    String? name,
    List<Review>? reviews,
    WorkoutSpotSize? size,
    Surface? surface,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkoutSpotModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkoutSpotModel.copyWith.fieldName(...)`
class _$WorkoutSpotModelCWProxyImpl implements _$WorkoutSpotModelCWProxy {
  const _$WorkoutSpotModelCWProxyImpl(this._value);

  final WorkoutSpotModel _value;

  @override
  WorkoutSpotModel address(Address? address) => this(address: address);

  @override
  WorkoutSpotModel coordinates(MapPosition? coordinates) => this(coordinates: coordinates);

  @override
  WorkoutSpotModel description(String? description) => this(description: description);

  @override
  WorkoutSpotModel distanceFromUserInKm(double? distanceFromUserInKm) =>
      this(distanceFromUserInKm: distanceFromUserInKm);

  @override
  WorkoutSpotModel equipment(List<Equipment> equipment) => this(equipment: equipment);

  @override
  WorkoutSpotModel id(int? id) => this(id: id);

  @override
  WorkoutSpotModel images(List<String> images) => this(images: images);

  @override
  WorkoutSpotModel name(String? name) => this(name: name);

  @override
  WorkoutSpotModel reviews(List<Review> reviews) => this(reviews: reviews);

  @override
  WorkoutSpotModel size(WorkoutSpotSize? size) => this(size: size);

  @override
  WorkoutSpotModel surface(Surface? surface) => this(surface: surface);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkoutSpotModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkoutSpotModel(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkoutSpotModel call({
    Object? address = const $CopyWithPlaceholder(),
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? distanceFromUserInKm = const $CopyWithPlaceholder(),
    Object? equipment = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? images = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? reviews = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? surface = const $CopyWithPlaceholder(),
  }) {
    return WorkoutSpotModel(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as Address?,
      coordinates: coordinates == const $CopyWithPlaceholder()
          ? _value.coordinates
          // ignore: cast_nullable_to_non_nullable
          : coordinates as MapPosition?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      distanceFromUserInKm: distanceFromUserInKm == const $CopyWithPlaceholder()
          ? _value.distanceFromUserInKm
          // ignore: cast_nullable_to_non_nullable
          : distanceFromUserInKm as double?,
      equipment: equipment == const $CopyWithPlaceholder() || equipment == null
          ? _value.equipment
          // ignore: cast_nullable_to_non_nullable
          : equipment as List<Equipment>,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      images: images == const $CopyWithPlaceholder() || images == null
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as List<String>,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      reviews: reviews == const $CopyWithPlaceholder() || reviews == null
          ? _value.reviews
          // ignore: cast_nullable_to_non_nullable
          : reviews as List<Review>,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as WorkoutSpotSize?,
      surface: surface == const $CopyWithPlaceholder()
          ? _value.surface
          // ignore: cast_nullable_to_non_nullable
          : surface as Surface?,
    );
  }
}

extension $WorkoutSpotModelCopyWith on WorkoutSpotModel {
  /// Returns a callable class that can be used as follows: `instanceOfWorkoutSpotModel.copyWith(...)` or like so:`instanceOfWorkoutSpotModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkoutSpotModelCWProxy get copyWith => _$WorkoutSpotModelCWProxyImpl(this);
}
