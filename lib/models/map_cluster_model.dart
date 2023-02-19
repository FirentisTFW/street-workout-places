import 'package:app/networking/models/map_position.dart';
import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';

class MapClusterModel extends Clusterable {
  final IconData icon;
  final VoidCallback? onPressed;

  MapClusterModel({
    required super.clusterId,
    required MapPosition? coordinates,
    required this.icon,
    this.onPressed,
  }) : super(
          latitude: coordinates?.latitude,
          longitude: coordinates?.longitude,
        );
}
