import 'package:app/models/map_cluster_model.dart';
import 'package:app/models/workout_spot_model.dart';

extension WorkoutSpotModelMapper on WorkoutSpotModel {
  MapClusterModel mapToMapClusterModel() => MapClusterModel(
        clusterId: id,
        coordinates: coordinates,
      );
}

extension WorkoutSpotModelListMapper on List<WorkoutSpotModel> {
  List<MapClusterModel> mapToMapClusterModels() {
    return map(
      (element) => element.mapToMapClusterModel(),
    ).toList();
  }
}
