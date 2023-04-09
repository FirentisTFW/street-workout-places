import 'dart:io';

import 'package:app/presentation/styles/app_animations.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Duration? animationDuration;
  final Widget child;
  final BoxDecoration? decoration;
  final double height;
  final bool shouldAnimateDecoration;
  final double? width;
  final VoidCallback onPressed;

  const AdaptiveButton({
    required this.child,
    this.decoration,
    this.height = AppDimensions.actionButtonHeight,
    this.width,
    required this.onPressed,
  })  : animationDuration = null,
        shouldAnimateDecoration = false;

  const AdaptiveButton.withAnimatedDecoration({
    this.animationDuration = AppAnimations.regularDuration,
    required this.child,
    this.decoration,
    this.height = AppDimensions.actionButtonHeight,
    this.width,
    required this.onPressed,
  }) : shouldAnimateDecoration = true;

  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (Platform.isIOS) {
      child = _buildCupertinoButton();
    } else {
      child = _buildMaterialButton();
    }
    return _buildButtonContainer(
      child: child,
    );
  }

  Widget _buildCupertinoButton() {
    return Container(
      height: height == double.infinity ? null : height,
      width: width,
      decoration: decoration,
      padding: EdgeInsets.zero,
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: child,
      ),
    );
  }

  Widget _buildMaterialButton() {
    final BorderRadiusGeometry? borderRadius = decoration?.borderRadius;
    final BoxShape? shape = decoration?.shape;
    return MaterialButton(
      height: height == double.infinity ? null : height,
      minWidth: width,
      elevation: 0.0,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      shape: shape == BoxShape.circle
          ? const CircleBorder()
          : borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: borderRadius,
                )
              : null,
      child: child,
    );
  }

  Widget _buildButtonContainer({
    required Widget child,
  }) {
    if (shouldAnimateDecoration) {
      return AnimatedContainer(
        height: height == double.infinity ? null : height,
        duration: animationDuration ?? AppAnimations.regularDuration,
        decoration: decoration,
        child: child,
      );
    }
    return Container(
      height: height == double.infinity ? null : height,
      width: width,
      decoration: decoration,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: child,
    );
  }
}
