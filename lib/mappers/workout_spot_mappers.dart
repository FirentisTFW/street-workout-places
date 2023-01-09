import 'package:app/extensions/extensions.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/workout_spot.dart';

extension WorkoutSpotMapper on WorkoutSpot {
  WorkoutSpotModel mapToWorkoutSpotModel() => WorkoutSpotModel(
        address: address,
        coordinates: coordinates,
        description: description,
        equipment: equipment.orEmpty().filterNotNull(),
        images: images.orEmpty().filterNotNull(),
        name: name,
        size: size,
        surface: surface,
      );
}

extension WorkoutSpotMapperList on List<WorkoutSpot> {
  List<WorkoutSpotModel> mapToWorkoutSpotModels() {
    return map(
      (element) => element.mapToWorkoutSpotModel(),
    ).toList();
  }
}
