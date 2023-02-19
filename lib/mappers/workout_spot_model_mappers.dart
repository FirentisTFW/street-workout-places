import 'package:app/models/map_cluster_model.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:flutter/material.dart';

extension WorkoutSpotModelMapper on WorkoutSpotModel {
  MapClusterModel mapToMapClusterModel() => MapClusterModel(
        clusterId: id,
        coordinates: coordinates,
        icon: Icons.location_pin,
      );
}

extension WorkoutSpotModelListMapper on List<WorkoutSpotModel> {
  List<MapClusterModel> mapToMapClusterModels() {
    return map(
      (element) => element.mapToMapClusterModel(),
    ).toList();
  }
}
