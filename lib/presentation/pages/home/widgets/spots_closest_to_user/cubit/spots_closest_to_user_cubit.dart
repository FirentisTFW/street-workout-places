import 'dart:async';

import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/constants.dart';
import 'package:app/domain/models/filters.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/services/spots_filtering_service.dart';
import 'package:app/domain/services/user_location_service.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spots_closest_to_user_state.dart';

class SpotsClosestToUserCubit extends Cubit<SpotsClosestToUserState> {
  final SpotsFilteringService filteringService;
  final SpotsCubit spotsCubit;
  final UserLocationService userLocationService;

  SpotsClosestToUserCubit({
    required this.filteringService,
    required this.spotsCubit,
    required this.userLocationService,
  }) : super(const SpotsClosestToUserInProgress());

  Future<void> checkPermissionAndFetchSpots() async {
    final bool hasLocationPermission = await userLocationService.hasPermission;

    if (hasLocationPermission) {
      fetchSpots();
    } else {
      emit(const SpotsClosestToUserNoLocationPermission());
    }
  }

  Future<void> fetchSpots() async {
    final MapPosition? userLocation = await userLocationService.location;

    if (userLocation == null) {
      emit(const SpotsClosestToUserNoLocationPermission());
      return;
    }

    final SpotsState spotsState = spotsCubit.state;

    if (spotsState is SpotsFetchSuccess) {
      final List<WorkoutSpotModel> closestSpots = filteringService.filterSpots(
        filters: const Filters.empty().copyWith(
          maxDistanceInKm: Constants.spots.spotsClosestToUserDistanceInKm,
        ),
        spots: spotsState.spots,
        userPosition: userLocation,
      );

      emit(
        SpotsClosestToUserFetchSuccessful(
          spots: closestSpots,
        ),
      );
    } else {
      emit(const SpotsClosestToUserFetchFailure());
    }
  }
}
