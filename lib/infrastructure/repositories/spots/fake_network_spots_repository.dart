import 'package:app/domain/core/common/mocks/workout_spot_mocks.dart';
import 'package:app/infrastructure/networking/models/workout_spot.dart';
import 'package:app/infrastructure/repositories/spots/i_network_spots_repository.dart';

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
