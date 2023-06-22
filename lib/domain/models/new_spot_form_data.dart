import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:equatable/equatable.dart';

class NewSpotFormData extends Equatable {
  final String city;
  final String description;
  final String? houseNumber;
  final MapPosition mapPosition;
  final String name;
  final WorkoutSpotSize size;
  final String? street;
  final Surface surface;

  const NewSpotFormData({
    required this.city,
    required this.description,
    required this.houseNumber,
    required this.mapPosition,
    required this.name,
    required this.size,
    required this.street,
    required this.surface,
  });

  @override
  List<Object?> get props => [
        city,
        description,
        houseNumber,
        mapPosition,
        name,
        size,
        street,
        surface,
      ];
}
