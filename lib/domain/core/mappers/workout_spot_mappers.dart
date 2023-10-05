import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/infrastructure/networking/models/workout_spot.dart';

extension WorkoutSpotMapper on WorkoutSpot {
  WorkoutSpotModel mapToWorkoutSpotModel() => WorkoutSpotModel(
        address: address,
        coordinates: coordinates,
        description: description,
        equipment: equipment.orEmpty().filterNotNull(),
        id: id,
        images: images.orEmpty().filterNotNull(),
        name: name,
        size: size,
        surface: surface,
      );
}

extension WorkoutSpotListMapper on List<WorkoutSpot> {
  List<WorkoutSpotModel> mapToWorkoutSpotModels() {
    return map(
      (element) => element.mapToWorkoutSpotModel(),
    ).toList();
  }
}
