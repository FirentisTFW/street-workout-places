part of 'spot_details_bloc.dart';

@freezed
class SpotDetailsState with _$SpotDetailsState {
  const factory SpotDetailsState.initial({
    required WorkoutSpotModel spot,
  }) = _Initial;
}
