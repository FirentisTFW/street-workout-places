import 'dart:math';

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
    @Default([]) List<Equipment> equipment,
    int? id,
    @Default([]) List<String> images,
    String? name,
    WorkoutSpotSize? size,
    Surface? surface,
  }) = _WorkoutSpotModel;

  const WorkoutSpotModel._();

  String? get primaryImage {
    // TODO Uncomment and remove mocks
    if (Random().nextBool()) {
      return 'https://lh3.googleusercontent.com/p/AF1QipMRTY1h-st6dH6nABWrEvCrxfiGRjYXRGIF5LLL=w600-k';
    }
    return 'https://lh5.googleusercontent.com/p/AF1QipP5ghK2uD5Bxj1HeUcfIn-pSVp9eRP8NVA3LLPZ=w408-h306-k-no';
    // return images.firstOrNull;
  }

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
