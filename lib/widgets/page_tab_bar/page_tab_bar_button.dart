import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/widgets/adaptive_button.dart';
import 'package:flutter/material.dart';

class PageTabBarButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onPressed;

  const PageTabBarButton(
    this.title, {
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AdaptiveButton(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: AppTextStyles.tabBarButton(
              isSelected: isSelected,
            ),
          ),
        ),
      ],
    );
  }
}
