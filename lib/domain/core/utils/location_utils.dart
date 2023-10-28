import 'dart:math';

import 'package:app/infrastructure/networking/models/map_position.dart';

abstract class LocationUtils {
  const LocationUtils._();

  // TODO Write unit tests
  // The formula taken from: https://stackoverflow.com/a/21623206/14451574
  static double calculateDistanceBetweenPositionsInKm(
    MapPosition position1,
    MapPosition position2,
  ) {
    final (double? lat1, double? long1) = (position1.latitude, position1.longitude);
    final (double? lat2, double? long2) = (position2.latitude, position2.longitude);

    // TODO Consider throwing an exception here
    if (lat1 == null || long1 == null || lat2 == null || long2 == null) return double.infinity;

    const double p = pi / 180;
    final double a =
        0.5 - cos((lat2 - lat1) * p) / 2 + cos(lat1 * p) * cos(lat2 * p) * (1 - cos((long2 - long1) * p)) / 2;

    const int earthRadiusInKm = 6371;

    return 2 * earthRadiusInKm * asin(sqrt(a));
  }
}
