import 'package:bloc_presentation/bloc_presentation.dart';

abstract class SpotsPresentationEvent implements BlocPresentationEvent {
  const SpotsPresentationEvent();
}

class SortingSpotsMissingLocationPermission extends SpotsPresentationEvent {
  const SortingSpotsMissingLocationPermission();
}
