import 'package:app/infrastructure/networking/models/address.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:equatable/equatable.dart';

class WorkoutSpot extends Equatable {
  final Address? address;
  final MapPosition? coordinates;
  final String? description;
  final List<Equipment?>? equipment;
  final List<String?>? images;
  final String? name;
  final WorkoutSpotSize? size;
  final Surface? surface;

  const WorkoutSpot({
    this.address,
    this.coordinates,
    this.description,
    this.equipment,
    this.images,
    this.name,
    this.size,
    this.surface,
  });

  @override
  List<Object?> get props => [
        address,
        coordinates,
        description,
        equipment,
        images,
        name,
        size,
        surface,
      ];
}
