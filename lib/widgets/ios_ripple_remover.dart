import 'dart:io';

import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class IosRippleRemover extends StatelessWidget {
  final Widget child;

  const IosRippleRemover({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) return child;
    return Theme(
      data: ThemeData(
        highlightColor: AppColors.transparent,
        splashColor: AppColors.transparent,
      ),
      child: child,
    );
  }
}
