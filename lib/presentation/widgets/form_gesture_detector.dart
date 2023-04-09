import 'package:flutter/material.dart';

class FormGestureDetector extends StatelessWidget {
  final Widget child;

  const FormGestureDetector({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
