import 'dart:async';

import 'package:app/blocs/spots/spots_cubit.dart';
import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/models/map_bounds_model.dart';
import 'package:app/models/map_cluster_model.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/services/map_clusters_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_clusters_cubit.freezed.dart';
part 'map_clusters_state.dart';

class MapClustersCubit extends Cubit<MapClustersState> {
  final MapClustersService mapClustersService;
  final IMapCoordinator mapCoordinator;
  final SpotsCubit spotsCubit;
  late final StreamSubscription<SpotsState> spotsCubitStreamSubscription;

  MapClustersCubit({
    required this.mapClustersService,
    required this.mapCoordinator,
    required this.spotsCubit,
  }) : super(
          const MapClustersState.initial(
            clusters: [],
          ),
        ) {
    _setUpSpotsCubitListener();
  }

  void _setUpSpotsCubitListener() {
    spotsCubitStreamSubscription = spotsCubit.stream.listen(
      (state) {
        state.maybeMap(
          fetchSpotsSuccess: (state) => updateClusters(
            spots: state.filteredSpots,
          ),
          orElse: () {
            /* No implementation needed */
          },
        );
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
      _Initial(
        clusters: clusters,
      ),
    );
  }
}
