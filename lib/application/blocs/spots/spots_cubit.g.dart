// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spots_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SpotsFetchSuccessCWProxy {
  SpotsFetchSuccess filteredSpots(List<WorkoutSpotModel> filteredSpots);

  SpotsFetchSuccess spots(List<WorkoutSpotModel> spots);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SpotsFetchSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SpotsFetchSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  SpotsFetchSuccess call({
    List<WorkoutSpotModel>? filteredSpots,
    List<WorkoutSpotModel>? spots,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSpotsFetchSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSpotsFetchSuccess.copyWith.fieldName(...)`
class _$SpotsFetchSuccessCWProxyImpl implements _$SpotsFetchSuccessCWProxy {
  const _$SpotsFetchSuccessCWProxyImpl(this._value);

  final SpotsFetchSuccess _value;

  @override
  SpotsFetchSuccess filteredSpots(List<WorkoutSpotModel> filteredSpots) =>
      this(filteredSpots: filteredSpots);

  @override
  SpotsFetchSuccess spots(List<WorkoutSpotModel> spots) => this(spots: spots);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SpotsFetchSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SpotsFetchSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  SpotsFetchSuccess call({
    Object? filteredSpots = const $CopyWithPlaceholder(),
    Object? spots = const $CopyWithPlaceholder(),
  }) {
    return SpotsFetchSuccess(
      filteredSpots:
          filteredSpots == const $CopyWithPlaceholder() || filteredSpots == null
              ? _value.filteredSpots
              // ignore: cast_nullable_to_non_nullable
              : filteredSpots as List<WorkoutSpotModel>,
      spots: spots == const $CopyWithPlaceholder() || spots == null
          ? _value.spots
          // ignore: cast_nullable_to_non_nullable
          : spots as List<WorkoutSpotModel>,
    );
  }
}

extension $SpotsFetchSuccessCopyWith on SpotsFetchSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfSpotsFetchSuccess.copyWith(...)` or like so:`instanceOfSpotsFetchSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SpotsFetchSuccessCWProxy get copyWith =>
      _$SpotsFetchSuccessCWProxyImpl(this);
}
