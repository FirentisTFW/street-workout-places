import 'package:app/styles/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppTextStyles {
  static const String robotoFontFamily = 'Roboto';

  const AppTextStyles._();

  static TextStyle addressBig({
    Color color = AppColors.grey2,
  }) {
    return TextStyle(
      color: color,
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      fontFamily: robotoFontFamily,
    );
  }

  static TextStyle addressSmall({
    Color color = AppColors.grey2,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: robotoFontFamily,
    );
  }

  static TextStyle content({
    Color color = AppColors.black,
    double height = 1.0,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: robotoFontFamily,
      height: height,
    );
  }

  static TextStyle contentBigger({
    Color color = AppColors.black,
    double height = 1.0,
  }) {
    return content(
      color: color,
      fontSize: 16.0,
      height: height,
    );
  }

  static TextStyle contentBold({
    Color color = AppColors.black,
    double height = 1.0,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return content(
      color: color,
      height: height,
      fontWeight: fontWeight,
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

  static TextStyle primaryButton({
    Color color = AppColors.white,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
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

  static TextStyle titleBig({
    Color color = AppColors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      fontFamily: robotoFontFamily,
    );
  }

  static TextStyle titleSmall({
    Color color = AppColors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: robotoFontFamily,
    );
  }
}
