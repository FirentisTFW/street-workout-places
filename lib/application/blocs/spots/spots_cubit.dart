import 'dart:async';

import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/domain/core/utils/search_utils.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/infrastructure/networking/models/workout_spot.dart';
import 'package:app/infrastructure/repositories/spots/i_spots_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spots_cubit.freezed.dart';
part 'spots_state.dart';

class SpotsCubit extends Cubit<SpotsState> {
  final ISpotsRepository spotsRepository;

  SpotsCubit({
    required this.spotsRepository,
  }) : super(const _Initial());

  Future<void> fetchSpots() async {
    try {
      emit(
        const _FetchSpotsInProgress(),
      );
      // TODO Consider wrapping in ApiResponse or something similar
      final List<WorkoutSpot> spots = await spotsRepository.workoutSpots();
      final List<WorkoutSpotModel> spotsModels = spots.mapToWorkoutSpotModels();
      emit(
        _FetchSpotsSuccess(
          filteredSpots: spotsModels,
          spots: spotsModels,
        ),
      );
    } catch (exception) {
      emit(
        _FetchSpotsFailure(
          error: ContainerError.fromException(exception),
        ),
      );
    }
  }

  FutureOr<void> filterSpotsByQuery(String query) async {
    final SpotsState entryState = state;
    if (entryState is! _FetchSpotsSuccess) return;
    final List<WorkoutSpotModel> filteredSpots = entryState.spots
        .where(
          (spot) => SearchUtils.checkIfSpotMatchesQuery(
            spot: spot,
            query: query,
          ),
        )
        .toList();
    emit(
      _FetchSpotsSuccess(
        filteredSpots: filteredSpots,
        spots: entryState.spots,
      ),
    );
  }
}
