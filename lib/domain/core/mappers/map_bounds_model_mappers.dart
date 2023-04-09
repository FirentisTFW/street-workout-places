import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/models/map_bounds_model.dart';

extension MapBoundsModelMapper on MapBoundsModel {
  List<double>? maybeMapToFlusterBoundingBox() {
    final List<double> result = [
      southWest.longitude,
      southWest.latitude,
      northEast.longitude,
      northEast.latitude,
    ].filterNotNull();
    if (result.length == 4) return result;
    return null;
  }
}
