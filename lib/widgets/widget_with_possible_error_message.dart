import 'package:app/styles/app_text_styles.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';

// TODO Think of a better name for this widget
class WidgetWithPossibleErrorMessage extends StatelessWidget {
  final Widget child;
  final String? errorMessage;

  const WidgetWithPossibleErrorMessage({
    super.key,
    required this.child,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final String? errorMessageLocal = errorMessage;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        if (errorMessageLocal != null) ...[
          const Space.vertical(10.0),
          _buildErrorMessage(errorMessageLocal),
        ],
      ],
    );
  }

  Widget _buildErrorMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
      ),
      child: Text(
        message,
        style: AppTextStyles.error(),
      ),
    );
  }
}
