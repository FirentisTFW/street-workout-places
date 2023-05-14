import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';

class Filters {
  final List<Equipment> equipment;
  final double? maxDistanceInKm;
  final List<WorkoutSpotSize> sizes;
  final List<Surface> surfaces;

  const Filters({
    required this.equipment,
    required this.maxDistanceInKm,
    required this.sizes,
    required this.surfaces,
  });

  const Filters.empty()
      : equipment = const [],
        maxDistanceInKm = null,
        sizes = const [],
        surfaces = const [];
}
