import 'package:app/styles/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppTextStyles {
  static const String robotoFontFamily = 'Roboto';

  const AppTextStyles._();

  static TextStyle content({
    Color color = AppColors.black,
    double height = 1.0,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: robotoFontFamily,
      height: height,
    );
  }

  static TextStyle contentMultiline({
    Color color = AppColors.black,
    double height = 1.4,
  }) {
    return content(
      color: color,
      height: height,
    );
  }

  static TextStyle informationSecondary({
    Color color = AppColors.grey2,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: robotoFontFamily,
    );
  }

  static TextStyle spotTitle({
    Color color = AppColors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: robotoFontFamily,
    );
  }

  static TextStyle tabBarButton({
    required bool isSelected,
  }) {
    return TextStyle(
      color: isSelected ? AppColors.white : AppColors.black,
      fontSize: 14.0,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      fontFamily: robotoFontFamily,
    );
  }

  static TextStyle textFieldContent() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: robotoFontFamily,
    );
  }

  static TextStyle textFieldLabel() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: robotoFontFamily,
    );
  }
}
