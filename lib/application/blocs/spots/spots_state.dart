part of 'spots_cubit.dart';

sealed class SpotsState extends Equatable {
  const SpotsState();

  @override
  List<Object?> get props => [];
}

class SpotsInitial extends SpotsState {
  const SpotsInitial();
}

class SpotsFetchInProgress extends SpotsState {
  const SpotsFetchInProgress();
}

class SpotsFetchSuccess extends SpotsState {
  final List<WorkoutSpotModel> filteredSpots;
  final List<WorkoutSpotModel> spots;

  const SpotsFetchSuccess({
    required this.filteredSpots,
    required this.spots,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        filteredSpots,
        spots,
      ];
}

class SpotsFetchFailure extends SpotsState {
  final ContainerError error;

  const SpotsFetchFailure({
    required this.error,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        error,
      ];
}
