import 'package:app/domain/models/workout_spot_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkoutSpotModel -', () {
    group('distanceFromUserDisplay -', () {
      test('when distance from user is not calculated, returns null', () {
        final String? result = const WorkoutSpotModel(id: 1).distanceFromUserDisplay;
        expect(result, null);
      });
      test('when distance from user is over 5 km, returns rounded distance without the fractional part', () {
        final String? result = const WorkoutSpotModel(id: 1, distanceFromUserInKm: 5.876).distanceFromUserDisplay;
        expect(result, '6');
      });
      test('when distance from user is below 5 km, returns distance with one fractional digit', () {
        final String? result = const WorkoutSpotModel(id: 1, distanceFromUserInKm: 2.8888).distanceFromUserDisplay;
        expect(result, '2.9');
      });
    });
  });
}
