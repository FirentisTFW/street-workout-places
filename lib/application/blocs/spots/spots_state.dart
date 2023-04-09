part of 'spots_cubit.dart';

@freezed
class SpotsState with _$SpotsState {
  const factory SpotsState.initial() = _Initial;

  const factory SpotsState.fetchSpotsInProgress() = _FetchSpotsInProgress;

  const factory SpotsState.fetchSpotsSuccess({
    required List<WorkoutSpotModel> filteredSpots,
    required List<WorkoutSpotModel> spots,
  }) = _FetchSpotsSuccess;

  const factory SpotsState.fetchSpotsFailure({
    required ContainerError error,
  }) = _FetchSpotsFailure;
}
