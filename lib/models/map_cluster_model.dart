import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:fluster/fluster.dart';

class MapClusterModel extends Clusterable {
  /// Direct spot that this object is representing. If the object is a cluster, [directSpot] is null.
  final WorkoutSpotModel? directSpot;

  MapClusterModel({
    this.directSpot,
    required super.clusterId,
    required MapPosition? coordinates,
    super.isCluster = false,
    super.pointsSize = 1,
  }) : super(
          latitude: coordinates?.latitude,
          longitude: coordinates?.longitude,
        );
}
