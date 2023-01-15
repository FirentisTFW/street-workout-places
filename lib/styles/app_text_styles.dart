import 'package:app/styles/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppTextStyles {
  // TODO Update text styles, add custom font
  const AppTextStyles._();

  static TextStyle tabBarButton({
    required bool isSelected,
  }) {
    return TextStyle(
      color: isSelected ? AppColors.white : AppColors.black,
      fontSize: 14.0,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    );
  }
}
