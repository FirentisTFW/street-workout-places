import 'package:app/networking/models/workout_spot.dart';

abstract class ISpotsRepository {
  const ISpotsRepository();

  Future<List<WorkoutSpot>> workoutSpots();
}
