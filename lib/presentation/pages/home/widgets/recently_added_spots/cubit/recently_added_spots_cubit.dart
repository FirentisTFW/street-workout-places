import 'package:app/domain/core/common/mocks/workout_spot_mocks.dart';
import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recently_added_spots_state.dart';

class RecentlyAddedSpotsCubit extends Cubit<RecentlyAddedSpotsState> {
  RecentlyAddedSpotsCubit() : super(const RecentlyAddedSpotsInProgress());

  Future<void> fetchSpots() async {
    emit(const RecentlyAddedSpotsInProgress());

    try {
      // TODO Perform API call and remove mocks

      final List<WorkoutSpotModel> spots = WorkoutSpotMocks.spots.mapToWorkoutSpotModels();

      emit(
        RecentlyAddedSpotsFetchSuccessful(
          spots: spots,
        ),
      );
    } catch (_) {
      emit(
        const RecentlyAddedSpotsFetchFailure(),
      );
    }
  }
}
