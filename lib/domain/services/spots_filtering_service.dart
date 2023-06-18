import 'package:app/domain/core/errors/user_input/other_input_error.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/core/utils/location_utils.dart';
import 'package:app/domain/core/utils/search_utils.dart';
import 'package:app/domain/models/filters.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';

class SpotsFilteringService {
  List<WorkoutSpotModel> filterSpots({
    required Filters filters,
    required List<WorkoutSpotModel> spots,
    MapPosition? userPosition,
  }) {
    return spots.where(
      (spot) {
        final (MapPosition? coordinates, double? maxDistanceInKm) = (spot.coordinates, filters.maxDistanceInKm);
        if (coordinates != null && maxDistanceInKm != null) {
          if (userPosition == null) {
            // Not reachable
            throw const NoUserPositionProvidedForFiltersError();
          }
          final double distanceInKm = LocationUtils.calculateDistanceBetweenPositionsInKm(coordinates, userPosition);
          if (distanceInKm.round() > maxDistanceInKm) return false;
        }

        if (filters.equipment.isNotEmpty) {
          final bool hasEquipmentMatch = filters.equipment.every(
            (element) => spot.equipment.contains(element),
          );
          if (!hasEquipmentMatch) return false;
        }

        if (filters.sizes.isNotEmpty) {
          final bool hasSizeMatch = filters.sizes.contains(spot.size);
          if (!hasSizeMatch) return false;
        }

        if (filters.surfaces.isNotEmpty) {
          final bool hasSurfaceMatch = filters.surfaces.contains(spot.surface);
          if (!hasSurfaceMatch) return false;
        }

        if (filters.query.isNotNullOrBlank) {
          final bool hasQueryMatch = SearchUtils.checkIfSpotMatchesQuery(
            spot: spot,
            query: filters.query.orEmpty(),
          );
          if (!hasQueryMatch) return false;
        }
        return true;
      },
    ).toList();
  }
}
