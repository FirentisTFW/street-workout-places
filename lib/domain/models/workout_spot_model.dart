import 'package:app/domain/core/utils/location_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/infrastructure/networking/models/address.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'workout_spot_model.g.dart';

@CopyWith()
class WorkoutSpotModel extends Equatable {
  final Address? address;
  final MapPosition? coordinates;
  final String? description;
  final double? distanceFromUserInKm;
  final List<Equipment> equipment;
  final int? id;
  final List<String> images;
  final String? name;
  final WorkoutSpotSize? size;
  final Surface? surface;

  const WorkoutSpotModel({
    this.address,
    this.coordinates,
    this.description,
    this.distanceFromUserInKm,
    this.equipment = const [],
    this.id,
    this.images = const [],
    this.name,
    this.size,
    this.surface,
  });

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

  @override
  List<Object?> get props => [
        address,
        coordinates,
        description,
        distanceFromUserInKm,
        equipment,
        id,
        images,
        name,
        size,
        surface,
      ];
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
