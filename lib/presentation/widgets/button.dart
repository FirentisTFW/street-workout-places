import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_decorations.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/app_progress_indicator.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  secondary;

  BoxDecoration get _decoration => switch (this) {
        ButtonType.primary => AppDecorations.primaryButton,
        ButtonType.secondary => AppDecorations.secondaryButton,
      };

  TextStyle get _textStyle => switch (this) {
        ButtonType.primary => AppTextStyles.primaryButton(),
        ButtonType.secondary => AppTextStyles.secondaryButton(),
      };
}

class Button extends StatelessWidget {
  final String text;
  final bool isLoading;
  final ButtonType type;
  final VoidCallback onPressed;

  const Button(
    this.text, {
    this.isLoading = false,
    this.type = ButtonType.primary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AdaptiveButton(
        decoration: type._decoration,
        onPressed: onPressed,
        child: isLoading
            ? const SizedBox.square(
                dimension: 30.0,
                child: AppProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2.0,
                ),
              )
            : Text(
                text.toUpperCase(),
                style: type._textStyle,
              ),
      ),
    );
  }
}
