import 'package:app/common/mocks/workout_spot_mocks.dart';
import 'package:app/networking/models/workout_spot.dart';
import 'package:app/repositories/spots/i_network_spots_repository.dart';

class FakeNetworkSpotsRepository implements INetworkSpotsRepository {
  const FakeNetworkSpotsRepository();

  @override
  Future<List<WorkoutSpot>> workoutSpots() async {
    await _simulateDelay();
    return WorkoutSpotMocks.spots;
  }

  Future<void> _simulateDelay({
    int milliseconds = 2000,
  }) async =>
      Future.delayed(
        Duration(
          milliseconds: milliseconds,
        ),
      );
}
