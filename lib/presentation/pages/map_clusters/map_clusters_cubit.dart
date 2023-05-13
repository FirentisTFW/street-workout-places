import 'dart:async';

import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/domain/models/map_bounds_model.dart';
import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/services/map_clusters_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'map_clusters_state.dart';

class MapClustersCubit extends Cubit<MapClustersState> {
  final MapClustersService mapClustersService;
  final MapCoordinator mapCoordinator;
  final SpotsCubit spotsCubit;
  late final StreamSubscription<SpotsState> spotsCubitStreamSubscription;

  MapClustersCubit({
    required this.mapClustersService,
    required this.mapCoordinator,
    required this.spotsCubit,
  }) : super(
          const MapClustersState.empty(),
        ) {
    _setUpSpotsCubitListener();
  }

  void _setUpSpotsCubitListener() {
    spotsCubitStreamSubscription = spotsCubit.stream.listen(
      (state) {
        if (state is SpotsFetchSuccess) {
          updateClusters(
            spots: state.filteredSpots,
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    spotsCubitStreamSubscription.cancel();
    return super.close();
  }

  void updateClusters({
    required List<WorkoutSpotModel> spots,
  }) {
    final MapBoundsModel? mapBounds = mapCoordinator.bounds;
    if (mapBounds == null) return;
    final List<MapClusterModel> clusters = mapClustersService.createClustersForSpots(
      bounds: mapBounds,
      spots: spots,
      zoom: mapCoordinator.zoom,
    );
    emit(
      MapClustersState(
        clusters: clusters,
      ),
    );
  }
}
