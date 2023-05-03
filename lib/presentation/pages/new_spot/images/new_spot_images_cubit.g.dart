// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_spot_images_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SpotImagesSelectedCWProxy {
  SpotImagesSelected defaultImagePath(String? defaultImagePath);

  SpotImagesSelected imagePaths(List<String> imagePaths);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SpotImagesSelected(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SpotImagesSelected(...).copyWith(id: 12, name: "My name")
  /// ````
  SpotImagesSelected call({
    String? defaultImagePath,
    List<String>? imagePaths,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSpotImagesSelected.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSpotImagesSelected.copyWith.fieldName(...)`
class _$SpotImagesSelectedCWProxyImpl implements _$SpotImagesSelectedCWProxy {
  const _$SpotImagesSelectedCWProxyImpl(this._value);

  final SpotImagesSelected _value;

  @override
  SpotImagesSelected defaultImagePath(String? defaultImagePath) =>
      this(defaultImagePath: defaultImagePath);

  @override
  SpotImagesSelected imagePaths(List<String> imagePaths) =>
      this(imagePaths: imagePaths);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SpotImagesSelected(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SpotImagesSelected(...).copyWith(id: 12, name: "My name")
  /// ````
  SpotImagesSelected call({
    Object? defaultImagePath = const $CopyWithPlaceholder(),
    Object? imagePaths = const $CopyWithPlaceholder(),
  }) {
    return SpotImagesSelected(
      defaultImagePath: defaultImagePath == const $CopyWithPlaceholder()
          ? _value.defaultImagePath
          // ignore: cast_nullable_to_non_nullable
          : defaultImagePath as String?,
      imagePaths:
          imagePaths == const $CopyWithPlaceholder() || imagePaths == null
              ? _value.imagePaths
              // ignore: cast_nullable_to_non_nullable
              : imagePaths as List<String>,
    );
  }
}

extension $SpotImagesSelectedCopyWith on SpotImagesSelected {
  /// Returns a callable class that can be used as follows: `instanceOfSpotImagesSelected.copyWith(...)` or like so:`instanceOfSpotImagesSelected.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SpotImagesSelectedCWProxy get copyWith =>
      _$SpotImagesSelectedCWProxyImpl(this);
}
