import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppCircularCheckbox extends StatelessWidget {
  final ValueNotifier<bool> isSelectedNotifier;
  final double size;

  const AppCircularCheckbox({
    required this.isSelectedNotifier,
    super.key,
    this.size = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ValueListenableBuilder(
        valueListenable: isSelectedNotifier,
        builder: (_, isSelected, __) {
          return AnimatedContainer(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.blue,
              ),
              color: isSelected ? AppColors.blue : AppColors.white,
              shape: BoxShape.circle,
            ),
            duration: AppAnimations.regularDuration,
            child: isSelected
                ? const Icon(
                    Icons.check,
                    size: 20.0,
                    color: AppColors.white,
                  )
                : null,
          );
        },
      ),
    );
  }
}
