import 'dart:io';

import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class RippleRemover extends StatelessWidget {
  final Widget child;
  final bool isEnabled;

  const RippleRemover({
    required this.child,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) return child;
    return Theme(
      data: ThemeData(
        highlightColor: AppColors.transparent,
        splashColor: AppColors.transparent,
      ),
      child: child,
    );
  }
}

class IosRippleRemover extends StatelessWidget {
  final Widget child;

  const IosRippleRemover({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RippleRemover(
      isEnabled: Platform.isIOS,
      child: child,
    );
  }
}
