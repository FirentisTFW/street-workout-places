import 'package:app/networking/models/map_position.dart';
import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';

class MapClusterModel extends Clusterable {
  final VoidCallback? onPressed;

  MapClusterModel({
    required super.clusterId,
    required MapPosition? coordinates,
    super.isCluster = false,
    super.pointsSize = 1,
    this.onPressed,
  }) : super(
          latitude: coordinates?.latitude,
          longitude: coordinates?.longitude,
        );
}
