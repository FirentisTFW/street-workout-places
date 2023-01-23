import 'package:flutter/material.dart';

enum WorkoutSpotSize {
  big,
  medium,
  small;

  String getDescription(BuildContext context) {
    // FIXME Localize
    switch (this) {
      case WorkoutSpotSize.big:
        return 'Duży';
      case WorkoutSpotSize.medium:
        return 'Średni';
      case WorkoutSpotSize.small:
        return 'Mały';
    }
  }
}
