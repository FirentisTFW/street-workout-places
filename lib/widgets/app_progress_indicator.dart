import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  final Color? color;
  final double strokeWidth;

  const AppProgressIndicator({
    this.color,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.black),
      ),
    );
  }
}
