import 'package:app/styles/app_decorations.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/widgets/adaptive_button.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton(
    this.text, {
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AdaptiveButton(
        decoration: AppDecorations.primaryButton,
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: AppTextStyles.primaryButton(),
        ),
      ),
    );
  }
}
