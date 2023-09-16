import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';

class ErrorViewBig extends StatelessWidget {
  final ContainerError error;
  final EdgeInsets padding;
  final VoidCallback onRetryPressed;

  const ErrorViewBig({
    required this.error,
    this.padding = EdgeInsets.zero,
    required this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO Remove hardcoded texts, update and style error body
    return Container(
      width: double.infinity,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Wystąpił błąd. Spróbuj ponownie',
            textAlign: TextAlign.center,
          ),
          const Space.vertical(20.0),
          AdaptiveButton(
            onPressed: onRetryPressed,
            child: const Text('Spróbuj ponownie'),
          ),
        ],
      ),
    );
  }
}
