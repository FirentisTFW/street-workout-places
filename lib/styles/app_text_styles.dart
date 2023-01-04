import 'package:flutter/widgets.dart';

class AppTextStyles {
  // TODO Update text styles
  const AppTextStyles._();

  static TextStyle tabBarButton({
    required bool isSelected,
  }) {
    return TextStyle(
      fontSize: 14.0,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    );
  }
}
