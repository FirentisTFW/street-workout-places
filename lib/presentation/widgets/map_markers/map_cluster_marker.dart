import 'package:app/domain/models/map_cluster_model.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class MapClusterMarker extends StatelessWidget {
  final MapClusterModel mapCluster;
  final VoidCallback? onPressed;

  const MapClusterMarker({
    required this.mapCluster,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}
