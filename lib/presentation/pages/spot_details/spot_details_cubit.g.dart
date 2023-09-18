// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_details_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SpotDetailsStateCWProxy {
  SpotDetailsState reviewsState(SpotDetailsReviewsState reviewsState);

  SpotDetailsState spot(WorkoutSpotModel spot);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SpotDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SpotDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SpotDetailsState call({
    SpotDetailsReviewsState? reviewsState,
    WorkoutSpotModel? spot,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSpotDetailsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSpotDetailsState.copyWith.fieldName(...)`
class _$SpotDetailsStateCWProxyImpl implements _$SpotDetailsStateCWProxy {
  const _$SpotDetailsStateCWProxyImpl(this._value);

  final SpotDetailsState _value;

  @override
  SpotDetailsState reviewsState(SpotDetailsReviewsState reviewsState) => this(reviewsState: reviewsState);

  @override
  SpotDetailsState spot(WorkoutSpotModel spot) => this(spot: spot);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SpotDetailsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SpotDetailsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SpotDetailsState call({
    Object? reviewsState = const $CopyWithPlaceholder(),
    Object? spot = const $CopyWithPlaceholder(),
  }) {
    return SpotDetailsState(
      reviewsState: reviewsState == const $CopyWithPlaceholder() || reviewsState == null
          ? _value.reviewsState
          // ignore: cast_nullable_to_non_nullable
          : reviewsState as SpotDetailsReviewsState,
      spot: spot == const $CopyWithPlaceholder() || spot == null
          ? _value.spot
          // ignore: cast_nullable_to_non_nullable
          : spot as WorkoutSpotModel,
    );
  }
}

extension $SpotDetailsStateCopyWith on SpotDetailsState {
  /// Returns a callable class that can be used as follows: `instanceOfSpotDetailsState.copyWith(...)` or like so:`instanceOfSpotDetailsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SpotDetailsStateCWProxy get copyWith => _$SpotDetailsStateCWProxyImpl(this);
}
