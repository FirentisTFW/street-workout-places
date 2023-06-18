import 'package:app/domain/core/utils/location_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/infrastructure/networking/models/address.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_spot_model.freezed.dart';

@freezed
class WorkoutSpotModel with _$WorkoutSpotModel {
  const factory WorkoutSpotModel({
    Address? address,
    MapPosition? coordinates,
    String? description,
    double? distanceFromUserInKm,
    @Default([]) List<Equipment> equipment,
    int? id,
    @Default([]) List<String> images,
    String? name,
    WorkoutSpotSize? size,
    Surface? surface,
  }) = _WorkoutSpotModel;

  const WorkoutSpotModel._();

  String? get distanceFromUserDisplay {
    if (distanceFromUserInKm case final distanceFromUserInKm?) {
      if (distanceFromUserInKm > 5) return distanceFromUserInKm.toStringAsFixed(0);
      return distanceFromUserInKm.toStringAsFixed(1);
    }
    return null;
  }

  String? get primaryImage => images.firstOrNull;

  String getEquipmentDescription(
    BuildContext context, {
    bool multiline = false,
  }) =>
      equipment
          .map(
            (element) => [
              if (multiline) '-',
              element.getDescription(S.of(context)),
            ].join(' '),
          )
          .join(multiline ? '\n' : ', ');
}

extension WorkoutSpotModelListExtension on List<WorkoutSpotModel> {
  List<WorkoutSpotModel> withCalculatedDistanceFromUser(MapPosition userLocation) {
    return map(
      (spot) {
        if (spot.coordinates case final spotPosition?) {
          final double distanceFromUserInKm =
              LocationUtils.calculateDistanceBetweenPositionsInKm(spotPosition, userLocation);
          return spot.copyWith(
            distanceFromUserInKm: distanceFromUserInKm,
          );
        }
        return spot;
      },
    ).toList();
  }

  // TODO Unit tests
  void sortByDistanceFromUser() {
    sort((a, b) => (a.distanceFromUserInKm ?? double.infinity).compareTo(b.distanceFromUserInKm ?? double.infinity));
  }
}
