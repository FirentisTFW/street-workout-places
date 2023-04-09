import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

enum WorkoutSpotSize {
  big,
  medium,
  small;

  String getDescription(BuildContext context) {
    switch (this) {
      case WorkoutSpotSize.big:
        return S.of(context).workoutSpotSizeDescriptionBig;
      case WorkoutSpotSize.medium:
        return S.of(context).workoutSpotSizeDescriptionMedium;
      case WorkoutSpotSize.small:
        return S.of(context).workoutSpotSizeDescriptionSmall;
    }
  }
}
