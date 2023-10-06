import 'package:app/domain/core/common/mocks/workout_spot_mocks.dart';
import 'package:app/infrastructure/networking/models/workout_spot.dart';
import 'package:app/infrastructure/networking/requests/submit_spot_request.dart';
import 'package:app/infrastructure/repositories/spots/network_spots_repository.dart';

class FakeNetworkSpotsRepository implements NetworkSpotsRepository {
  const FakeNetworkSpotsRepository();

  @override
  Future<void> submitSpot(SubmitSpotRequest request) => _simulateDelay();

  @override
  Future<List<WorkoutSpot>> workoutSpots() async {
    await _simulateDelay();
    return WorkoutSpotMocks.spots;
  }

  Future<void> _simulateDelay({
    int milliseconds = 2000,
  }) =>
      Future.delayed(
        Duration(
          milliseconds: milliseconds,
        ),
      );
}
