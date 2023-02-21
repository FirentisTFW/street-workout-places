import 'package:app/models/map_cluster_model.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class MapMarker extends StatelessWidget {
  final MapClusterModel mapCluster;

  const MapMarker({
    required this.mapCluster,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO Rethink onPressed placement
      onTap: mapCluster.onPressed,
      child: mapCluster.isCluster ?? false ? _buildClusterIconWithElementsSize() : _buildSingleLocationIcon(),
    );
  }

  Widget _buildClusterIconWithElementsSize() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blue,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          mapCluster.pointsSize.toString(),
          style: AppTextStyles.content(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSingleLocationIcon() {
    return const Icon(
      Icons.location_pin,
      color: AppColors.blue,
      size: 36.0,
    );
  }
}
