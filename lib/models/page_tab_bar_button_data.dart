import 'package:flutter/foundation.dart';

class PageTabBarButtonData {
  final String title;
  final VoidCallback onPressed;

  const PageTabBarButtonData({
    required this.title,
    required this.onPressed,
  });
}
