import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'filters.g.dart';

@CopyWith()
class Filters {
  final List<Equipment> equipment;
  final double? maxDistanceInKm;
  final List<WorkoutSpotSize> sizes;
  final List<Surface> surfaces;
  final String? query;

  int get count =>
      [
        equipment,
        sizes,
        surfaces,
      ].where((list) => list.isNotEmpty).length +
      [
        maxDistanceInKm,
        query,
      ].where((filter) => filter != null).length;

  const Filters({
    required this.equipment,
    required this.maxDistanceInKm,
    required this.sizes,
    required this.surfaces,
    required this.query,
  });

  const Filters.empty()
      : equipment = const [],
        maxDistanceInKm = null,
        sizes = const [],
        surfaces = const [],
        query = null;
}
