part of 'spots_closest_to_user_cubit.dart';

sealed class SpotsClosestToUserState extends Equatable {
  const SpotsClosestToUserState();

  @override
  List<Object> get props => [];
}

final class SpotsClosestToUserInProgress extends SpotsClosestToUserState {
  const SpotsClosestToUserInProgress();
}

final class SpotsClosestToUserNoPermission extends SpotsClosestToUserState {
  const SpotsClosestToUserNoPermission();
}

final class SpotsClosestToUserFetchSuccessful extends SpotsClosestToUserState {
  final List<WorkoutSpotModel> spots;

  const SpotsClosestToUserFetchSuccessful({
    required this.spots,
  });

  @override
  List<Object> get props => [
        ...super.props,
        spots,
      ];
}
