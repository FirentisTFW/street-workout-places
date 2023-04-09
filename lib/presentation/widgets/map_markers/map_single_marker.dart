import 'package:app/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MapSingleMarker extends StatelessWidget {
  final VoidCallback? onPressed;

  const MapSingleMarker({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: const Icon(
        Icons.location_pin,
        color: AppColors.blue,
        size: 36.0,
      ),
    );
  }
}
