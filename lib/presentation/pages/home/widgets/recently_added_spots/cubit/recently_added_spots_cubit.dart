import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/infrastructure/networking/models/workout_spot.dart';
import 'package:app/infrastructure/repositories/spots/spots_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recently_added_spots_state.dart';

class RecentlyAddedSpotsCubit extends Cubit<RecentlyAddedSpotsState> {
  final SpotsRepository spotsRepository;

  RecentlyAddedSpotsCubit({
    required this.spotsRepository,
  }) : super(const RecentlyAddedSpotsInProgress());

  Future<void> fetchSpots() async {
    emit(const RecentlyAddedSpotsInProgress());

    try {
      final List<WorkoutSpot> spots = await spotsRepository.recentlyAddedWorkoutSpots();

      emit(
        RecentlyAddedSpotsFetchSuccessful(
          spots: spots.mapToWorkoutSpotModels(),
        ),
      );
    } catch (_) {
      emit(
        const RecentlyAddedSpotsFetchFailure(),
      );
    }
  }
}
