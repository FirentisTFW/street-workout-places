part of 'recently_added_spots_cubit.dart';

sealed class RecentlyAddedSpotsState extends Equatable {
  const RecentlyAddedSpotsState();

  @override
  List<Object> get props => [];
}

final class RecentlyAddedSpotsInProgress extends RecentlyAddedSpotsState {
  const RecentlyAddedSpotsInProgress();
}

final class RecentlyAddedSpotsFetchSuccessful extends RecentlyAddedSpotsState {
  final List<WorkoutSpotModel> spots;

  const RecentlyAddedSpotsFetchSuccessful({
    required this.spots,
  });

  @override
  List<Object> get props => [
        ...super.props,
        spots,
      ];
}

final class RecentlyAddedSpotsFetchFailure extends RecentlyAddedSpotsState {
  const RecentlyAddedSpotsFetchFailure();
}
