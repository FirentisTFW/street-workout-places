import 'package:app/widgets/ripple_remover.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Widget child;
  final double circleSize;
  final Color? color;
  final VoidCallback onPressed;

  const CircularButton({
    required this.child,
    this.circleSize = 70.0,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IosRippleRemover(
      child: MaterialButton(
        color: color,
        height: circleSize,
        minWidth: 1.0,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
