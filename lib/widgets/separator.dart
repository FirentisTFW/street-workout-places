import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final Color color;
  final double height;
  final double? width;

  const Separator({
    this.color = AppColors.grey,
    this.height = 1.0,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
