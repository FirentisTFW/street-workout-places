import 'package:app/domain/models/workout_spot_model.dart';
import 'package:equatable/equatable.dart';

sealed class HomeSection extends Equatable {
  const HomeSection();
}

final class RecentlyAddedSpotsHomeSection extends HomeSection {
  final List<WorkoutSpotModel> spots;

  const RecentlyAddedSpotsHomeSection({
    required this.spots,
  });

  @override
  List<Object?> get props => [
        spots,
      ];
}

final class SpotsClosestToUserHomeSection extends HomeSection {
  final List<WorkoutSpotModel> spots;

  const SpotsClosestToUserHomeSection({
    required this.spots,
  });

  @override
  List<Object?> get props => [
        spots,
      ];
}
