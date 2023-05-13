import 'package:app/presentation/styles/app_animations.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppCircularCheckbox extends StatelessWidget {
  final bool value;
  final double size;

  const AppCircularCheckbox({
    required this.value,
    super.key,
    this.size = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.blue,
          ),
          color: value ? AppColors.blue : AppColors.white,
          shape: BoxShape.circle,
        ),
        duration: AppAnimations.regularDuration,
        child: value
            ? const Icon(
                Icons.check,
                size: 20.0,
                color: AppColors.white,
              )
            : null,
      ),
    );
  }
}
