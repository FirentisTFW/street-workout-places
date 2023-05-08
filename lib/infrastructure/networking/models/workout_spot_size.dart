import 'package:app/generated/l10n.dart';

enum WorkoutSpotSize {
  big,
  medium,
  small;

  String getDescription(S s) {
    switch (this) {
      case WorkoutSpotSize.big:
        return s.workoutSpotSizeDescriptionBig;
      case WorkoutSpotSize.medium:
        return s.workoutSpotSizeDescriptionMedium;
      case WorkoutSpotSize.small:
        return s.workoutSpotSizeDescriptionSmall;
    }
  }
}
