import 'dart:async';

import 'package:app/blocs/spots/spots_cubit.dart';
import 'package:app/models/map_bounds_model.dart';
import 'package:app/models/map_cluster_model.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/services/map_clusters_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_clusters_cubit.freezed.dart';
part 'map_clusters_state.dart';

class MapClustersCubit extends Cubit<MapClustersState> {
  final MapClustersService mapClustersService;
  final SpotsCubit spotsCubit;
  late final StreamSubscription<SpotsState> spotsCubitStreamSubscription;

  MapClustersCubit({
    required this.mapClustersService,
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
          fetchSpotsSuccess: (state) => updateClustersBasedOnSpots(
            // FIXME Remove mocks
            bounds: const MapBoundsModel(northEast: MapPosition(), southWest: MapPosition()),
            spots: state.filteredSpots,
            zoom: 8.0,
          ),
          orElse: () {
            // No implementation needed
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

  void updateClustersBasedOnSpots({
    required MapBoundsModel bounds,
    required List<WorkoutSpotModel> spots,
    required double zoom,
  }) {
    final List<MapClusterModel> clusters = mapClustersService.createClustersForSpots(
      bounds: bounds,
      spots: spots,
      zoom: zoom,
    );
    // ..map(
    //     (cluster) {
    //       // FIXME Update clusters - icon, onPressed etc.
    //       return cluster;
    //     },
    //   ).toList();

    emit(
      _Initial(
        clusters: clusters,
      ),
    );
  }
}
