import 'package:app/infrastructure/networking/models/workout_spot.dart';
import 'package:app/infrastructure/networking/requests/submit_spot_request.dart';

abstract interface class SpotsRepository {
  const SpotsRepository();

  Future<void> submitSpot(SubmitSpotRequest request);

  Future<List<WorkoutSpot>> workoutSpots();
}
