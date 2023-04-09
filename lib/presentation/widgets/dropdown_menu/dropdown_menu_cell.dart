import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:flutter/material.dart';

class DropdownMenuCell extends StatelessWidget {
  final BorderRadius? borderRadius;
  final String text;
  final VoidCallback onPressed;

  const DropdownMenuCell(
    this.text, {
    required this.borderRadius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 12.0,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.textFieldLabel(),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
