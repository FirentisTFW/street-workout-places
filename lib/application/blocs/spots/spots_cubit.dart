import 'dart:async';

import 'package:app/application/blocs/filters/filters_cubit.dart';
import 'package:app/application/blocs/spots/spots_presentation_event.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/services/spots_filtering_service.dart';
import 'package:app/domain/services/user_location_service.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/workout_spot.dart';
import 'package:app/infrastructure/repositories/spots/spots_repository.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spots_cubit.g.dart';
part 'spots_state.dart';

class SpotsCubit extends Cubit<SpotsState> with BlocPresentationMixin {
  final FiltersCubit filtersCubit;
  final SpotsRepository spotsRepository;
  final SpotsFilteringService spotsFilteringService;
  final UserLocationService userLocationService;

  late final StreamSubscription _filtersStream;

  SpotsCubit({
    required this.filtersCubit,
    required this.spotsRepository,
    required this.spotsFilteringService,
    required this.userLocationService,
  }) : super(const SpotsInitial()) {
    _filtersStream = filtersCubit.stream.listen(_onFiltersUpdated);
  }

  @override
  Future<void> close() {
    _filtersStream.cancel();
    return super.close();
  }

  void _onFiltersUpdated(FiltersState filtersState) {
    final SpotsState entryState = state;
    if (entryState is! SpotsFetchSuccess) return;

    final List<WorkoutSpotModel> filteredSpots = spotsFilteringService.filterSpots(
      filters: filtersState.filters,
      spots: entryState.spots,
      userPosition: filtersState.userPosition,
    );

    emit(
      entryState.updateFilteredSpots(filteredSpots),
    );
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

  Future<void> sortByDistanceFromUser() async {
    final SpotsState entryState = state;
    if (entryState is! SpotsFetchSuccess) return;

    final bool hasLocationPermission = await userLocationService.checkAndRequestLocationPermissions();
    if (!hasLocationPermission) {
      emitPresentation(const SortingSpotsMissingLocationPermission());
      return;
    }

    final MapPosition? userLocation = await userLocationService.location;
    if (userLocation == null) return;

    final List<WorkoutSpotModel> spotsWithDistanceFromUser =
        entryState.spots.withCalculatedDistanceFromUser(userLocation)..sortByDistanceFromUser();
    final List<WorkoutSpotModel> filteredSpotsWithDistanceFromUser =
        entryState.filteredSpots.withCalculatedDistanceFromUser(userLocation)..sortByDistanceFromUser();

    emit(
      SpotsFetchSuccess(
        filteredSpots: filteredSpotsWithDistanceFromUser,
        spots: spotsWithDistanceFromUser,
      ),
    );
  }
}
