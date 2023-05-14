import 'dart:async';

import 'package:app/application/blocs/filters/filters_cubit.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/domain/core/utils/search_utils.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/infrastructure/networking/models/workout_spot.dart';
import 'package:app/infrastructure/repositories/spots/spots_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spots_state.dart';

class SpotsCubit extends Cubit<SpotsState> {
  final FiltersCubit filtersCubit;
  final SpotsRepository spotsRepository;
  late final StreamSubscription filtersStream;

  SpotsCubit({
    required this.filtersCubit,
    required this.spotsRepository,
  }) : super(const SpotsInitial()) {
    filtersStream = filtersCubit.stream.listen(_onFiltersUpdated);
  }

  @override
  Future<void> close() {
    filtersStream.cancel();
    return super.close();
  }

  void _onFiltersUpdated(FiltersState filtersState) {
    // FIXME
    //  filter spots by filters (use a service for that),
    //  emit state with updated filters,
    //  add unit tests!
  }

  Future<void> fetchSpots() async {
    try {
      emit(
        const SpotsFetchInProgress(),
      );
      // TODO Consider wrapping in ApiResponse or something similar
      final List<WorkoutSpot> spots = await spotsRepository.workoutSpots();
      final List<WorkoutSpotModel> spotsModels = spots.mapToWorkoutSpotModels();
      emit(
        SpotsFetchSuccess(
          filteredSpots: spotsModels,
          spots: spotsModels,
        ),
      );
    } catch (exception) {
      emit(
        SpotsFetchFailure(
          error: ContainerError.fromException(exception),
        ),
      );
    }
  }

  FutureOr<void> filterSpotsByQuery(String query) async {
    final SpotsState entryState = state;
    if (entryState is! SpotsFetchSuccess) return;
    final List<WorkoutSpotModel> filteredSpots = entryState.spots
        .where(
          (spot) => SearchUtils.checkIfSpotMatchesQuery(
            spot: spot,
            query: query,
          ),
        )
        .toList();
    emit(
      SpotsFetchSuccess(
        filteredSpots: filteredSpots,
        spots: entryState.spots,
      ),
    );
  }
}
