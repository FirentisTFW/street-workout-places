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
        return true;
      },
    ).toList();
  }
}
