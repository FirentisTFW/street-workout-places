// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_essentials.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MapEssentialsCWProxy {
  MapEssentials initialCoordinates(MapPosition initialCoordinates);

  MapEssentials maxZoom(double maxZoom);

  MapEssentials minZoom(double minZoom);

  MapEssentials zoom(double zoom);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MapEssentials(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MapEssentials(...).copyWith(id: 12, name: "My name")
  /// ````
  MapEssentials call({
    MapPosition? initialCoordinates,
    double? maxZoom,
    double? minZoom,
    double? zoom,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMapEssentials.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMapEssentials.copyWith.fieldName(...)`
class _$MapEssentialsCWProxyImpl implements _$MapEssentialsCWProxy {
  const _$MapEssentialsCWProxyImpl(this._value);

  final MapEssentials _value;

  @override
  MapEssentials initialCoordinates(MapPosition initialCoordinates) =>
      this(initialCoordinates: initialCoordinates);

  @override
  MapEssentials maxZoom(double maxZoom) => this(maxZoom: maxZoom);

  @override
  MapEssentials minZoom(double minZoom) => this(minZoom: minZoom);

  @override
  MapEssentials zoom(double zoom) => this(zoom: zoom);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MapEssentials(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MapEssentials(...).copyWith(id: 12, name: "My name")
  /// ````
  MapEssentials call({
    Object? initialCoordinates = const $CopyWithPlaceholder(),
    Object? maxZoom = const $CopyWithPlaceholder(),
    Object? minZoom = const $CopyWithPlaceholder(),
    Object? zoom = const $CopyWithPlaceholder(),
  }) {
    return MapEssentials(
      initialCoordinates: initialCoordinates == const $CopyWithPlaceholder() ||
              initialCoordinates == null
          ? _value.initialCoordinates
          // ignore: cast_nullable_to_non_nullable
          : initialCoordinates as MapPosition,
      maxZoom: maxZoom == const $CopyWithPlaceholder() || maxZoom == null
          ? _value.maxZoom
          // ignore: cast_nullable_to_non_nullable
          : maxZoom as double,
      minZoom: minZoom == const $CopyWithPlaceholder() || minZoom == null
          ? _value.minZoom
          // ignore: cast_nullable_to_non_nullable
          : minZoom as double,
      zoom: zoom == const $CopyWithPlaceholder() || zoom == null
          ? _value.zoom
          // ignore: cast_nullable_to_non_nullable
          : zoom as double,
    );
  }
}

extension $MapEssentialsCopyWith on MapEssentials {
  /// Returns a callable class that can be used as follows: `instanceOfMapEssentials.copyWith(...)` or like so:`instanceOfMapEssentials.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MapEssentialsCWProxy get copyWith => _$MapEssentialsCWProxyImpl(this);
}
