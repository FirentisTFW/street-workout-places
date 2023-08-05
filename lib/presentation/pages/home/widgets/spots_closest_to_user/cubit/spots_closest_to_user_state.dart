part of 'spots_closest_to_user_cubit.dart';

sealed class SpotsClosestToUserState extends Equatable {
  const SpotsClosestToUserState();

  @override
  List<Object> get props => [];
}

final class SpotsClosestToUserInProgress extends SpotsClosestToUserState {
  const SpotsClosestToUserInProgress();
}

final class SpotsClosestToUserNoLocationPermission extends SpotsClosestToUserState {
  const SpotsClosestToUserNoLocationPermission();
}

final class SpotsClosestToUserFetchSuccessful extends SpotsClosestToUserState {
  final List<WorkoutSpotModel> spots;
  final MapPosition userLocation;

  const SpotsClosestToUserFetchSuccessful({
    required this.spots,
    required this.userLocation,
  });

  @override
  List<Object> get props => [
        ...super.props,
        spots,
        userLocation,
      ];
}

final class SpotsClosestToUserFetchFailure extends SpotsClosestToUserState {
  const SpotsClosestToUserFetchFailure();
}
