// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_spot_images_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NewSpotImagesStateCWProxy {
  NewSpotImagesState defaultImagePath(String? defaultImagePath);

  NewSpotImagesState imagePaths(List<String> imagePaths);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewSpotImagesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewSpotImagesState(...).copyWith(id: 12, name: "My name")
  /// ````
  NewSpotImagesState call({
    String? defaultImagePath,
    List<String>? imagePaths,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNewSpotImagesState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNewSpotImagesState.copyWith.fieldName(...)`
class _$NewSpotImagesStateCWProxyImpl implements _$NewSpotImagesStateCWProxy {
  const _$NewSpotImagesStateCWProxyImpl(this._value);

  final NewSpotImagesState _value;

  @override
  NewSpotImagesState defaultImagePath(String? defaultImagePath) => this(defaultImagePath: defaultImagePath);

  @override
  NewSpotImagesState imagePaths(List<String> imagePaths) => this(imagePaths: imagePaths);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NewSpotImagesState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NewSpotImagesState(...).copyWith(id: 12, name: "My name")
  /// ````
  NewSpotImagesState call({
    Object? defaultImagePath = const $CopyWithPlaceholder(),
    Object? imagePaths = const $CopyWithPlaceholder(),
  }) {
    return NewSpotImagesState(
      defaultImagePath: defaultImagePath == const $CopyWithPlaceholder()
          ? _value.defaultImagePath
          // ignore: cast_nullable_to_non_nullable
          : defaultImagePath as String?,
      imagePaths: imagePaths == const $CopyWithPlaceholder() || imagePaths == null
          ? _value.imagePaths
          // ignore: cast_nullable_to_non_nullable
          : imagePaths as List<String>,
    );
  }
}

extension $NewSpotImagesStateCopyWith on NewSpotImagesState {
  /// Returns a callable class that can be used as follows: `instanceOfNewSpotImagesState.copyWith(...)` or like so:`instanceOfNewSpotImagesState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NewSpotImagesStateCWProxy get copyWith => _$NewSpotImagesStateCWProxyImpl(this);
}
