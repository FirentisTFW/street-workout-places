import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/domain/models/workout_spot_model.dart';

extension WorkoutSpotModelMapper on WorkoutSpotModel {
  MapClusterModel mapToMapClusterModel() => MapClusterModel(
        clusterId: id,
        coordinates: coordinates,
        directSpot: this,
      );
}

extension WorkoutSpotModelListMapper on List<WorkoutSpotModel> {
  List<MapClusterModel> mapToMapClusterModels() {
    return map(
      (element) => element.mapToMapClusterModel(),
    ).toList();
  }
}
