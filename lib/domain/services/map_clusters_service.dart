import 'package:app/domain/core/mappers/mappers.dart';
import 'package:app/domain/core/utils/map_utils.dart';
import 'package:app/domain/models/map_bounds_model.dart';
import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:fluster/fluster.dart';

class MapClustersService {
  Fluster<MapClusterModel> _clusterMaker = MapUtils.provideClusterMaker(
    spots: [],
  );

  List<MapClusterModel> createClustersForSpots({
    required MapBoundsModel bounds,
    required List<WorkoutSpotModel> spots,
    required double zoom,
  }) {
    final List<double>? boundingBox = bounds.maybeMapToFlusterBoundingBox();
    if (boundingBox == null) return [];
    _clusterMaker = MapUtils.provideClusterMaker(
      spots: spots,
    );
    try {
      final List<MapClusterModel> clusters = _clusterMaker.clusters(boundingBox, zoom.round());
      return clusters;
    } catch (_) {
      // No implementation needed
    }
    return [];
  }
}
