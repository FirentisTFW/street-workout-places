import 'package:bloc_presentation/bloc_presentation.dart';

abstract class FiltersPresentationEvent implements BlocPresentationEvent {
  const FiltersPresentationEvent();
}

class FiltersMissingLocationPermission extends FiltersPresentationEvent {
  const FiltersMissingLocationPermission();
}
