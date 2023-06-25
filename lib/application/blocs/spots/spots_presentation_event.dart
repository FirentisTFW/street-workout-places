import 'package:bloc_presentation/bloc_presentation.dart';

sealed class SpotsPresentationEvent implements BlocPresentationEvent {
  const SpotsPresentationEvent();
}

final class SortingSpotsMissingLocationPermission extends SpotsPresentationEvent {
  const SortingSpotsMissingLocationPermission();
}

final class SortingSpotsInProgress extends SpotsPresentationEvent {
  const SortingSpotsInProgress();
}
