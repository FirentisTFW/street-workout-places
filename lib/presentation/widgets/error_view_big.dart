import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';

class ErrorViewBig extends StatelessWidget {
  final ContainerError error;
  final VoidCallback onRetryPressed;

  const ErrorViewBig({
    required this.error,
    required this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO Remove hardcoded texts, update and style error body
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Wystąpił błąd. Spróbuj ponownie'),
        const Space.vertical(20.0),
        AdaptiveButton(
          onPressed: onRetryPressed,
          child: const Text('Spróbuj ponownie'),
        ),
      ],
    );
  }
}
