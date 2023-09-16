// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FiltersCWProxy {
  Filters equipment(List<Equipment> equipment);

  Filters maxDistanceInKm(double? maxDistanceInKm);

  Filters sizes(List<WorkoutSpotSize> sizes);

  Filters surfaces(List<Surface> surfaces);

  Filters query(String? query);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Filters(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Filters(...).copyWith(id: 12, name: "My name")
  /// ````
  Filters call({
    List<Equipment>? equipment,
    double? maxDistanceInKm,
    List<WorkoutSpotSize>? sizes,
    List<Surface>? surfaces,
    String? query,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFilters.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFilters.copyWith.fieldName(...)`
class _$FiltersCWProxyImpl implements _$FiltersCWProxy {
  const _$FiltersCWProxyImpl(this._value);

  final Filters _value;

  @override
  Filters equipment(List<Equipment> equipment) => this(equipment: equipment);

  @override
  Filters maxDistanceInKm(double? maxDistanceInKm) => this(maxDistanceInKm: maxDistanceInKm);

  @override
  Filters sizes(List<WorkoutSpotSize> sizes) => this(sizes: sizes);

  @override
  Filters surfaces(List<Surface> surfaces) => this(surfaces: surfaces);

  @override
  Filters query(String? query) => this(query: query);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Filters(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Filters(...).copyWith(id: 12, name: "My name")
  /// ````
  Filters call({
    Object? equipment = const $CopyWithPlaceholder(),
    Object? maxDistanceInKm = const $CopyWithPlaceholder(),
    Object? sizes = const $CopyWithPlaceholder(),
    Object? surfaces = const $CopyWithPlaceholder(),
    Object? query = const $CopyWithPlaceholder(),
  }) {
    return Filters(
      equipment: equipment == const $CopyWithPlaceholder() || equipment == null
          ? _value.equipment
          // ignore: cast_nullable_to_non_nullable
          : equipment as List<Equipment>,
      maxDistanceInKm: maxDistanceInKm == const $CopyWithPlaceholder()
          ? _value.maxDistanceInKm
          // ignore: cast_nullable_to_non_nullable
          : maxDistanceInKm as double?,
      sizes: sizes == const $CopyWithPlaceholder() || sizes == null
          ? _value.sizes
          // ignore: cast_nullable_to_non_nullable
          : sizes as List<WorkoutSpotSize>,
      surfaces: surfaces == const $CopyWithPlaceholder() || surfaces == null
          ? _value.surfaces
          // ignore: cast_nullable_to_non_nullable
          : surfaces as List<Surface>,
      query: query == const $CopyWithPlaceholder()
          ? _value.query
          // ignore: cast_nullable_to_non_nullable
          : query as String?,
    );
  }
}

extension $FiltersCopyWith on Filters {
  /// Returns a callable class that can be used as follows: `instanceOfFilters.copyWith(...)` or like so:`instanceOfFilters.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiltersCWProxy get copyWith => _$FiltersCWProxyImpl(this);
}
