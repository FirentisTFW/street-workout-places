import 'package:app/networking/models/equipment.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/networking/models/surface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_spot.freezed.dart';

@freezed
class WorkoutSpot with _$WorkoutSpot {
  const factory WorkoutSpot({
    String? address,
    MapPosition? coordinates,
    String? description,
    List<Equipment?>? equipment,
    List<String?>? images,
    String? name,
    Surface? surface,
  }) = _WorkoutSpot;

  const WorkoutSpot._();
}
