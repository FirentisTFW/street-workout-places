import 'package:app/networking/models/address.dart';
import 'package:app/networking/models/equipment.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/networking/models/surface.dart';
import 'package:app/networking/models/workout_spot_size.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_spot_model.freezed.dart';

@freezed
class WorkoutSpotModel with _$WorkoutSpotModel {
  const factory WorkoutSpotModel({
    Address? address,
    MapPosition? coordinates,
    String? description,
    @Default([]) List<Equipment> equipment,
    @Default([]) List<String> images,
    String? name,
    WorkoutSpotSize? size,
    Surface? surface,
  }) = _WorkoutSpotModel;

  const WorkoutSpotModel._();
}
