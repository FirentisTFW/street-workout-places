import 'package:app/mappers/mappers.dart';
import 'package:app/models/map_bounds_model.dart';
import 'package:app/models/map_cluster_model.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/utils/map_utils.dart';
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
    _clusterMaker.clusters(boundingBox, zoom.round());
    return [];
  }
}
