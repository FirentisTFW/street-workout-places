import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/core/utils/search_utils.dart';
import 'package:app/domain/models/filters.dart';
import 'package:app/domain/models/workout_spot_model.dart';

class SpotsFilteringService {
  List<WorkoutSpotModel> filterSpots({
    required Filters filters,
    required List<WorkoutSpotModel> spots,
  }) {
    return spots.where(
      (spot) {
        // FIXME Check distance

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
