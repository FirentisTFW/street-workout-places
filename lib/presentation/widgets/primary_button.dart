import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_decorations.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/app_progress_indicator.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const PrimaryButton(
    this.text, {
    this.isLoading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AdaptiveButton(
        decoration: AppDecorations.primaryButton,
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
                style: AppTextStyles.primaryButton(),
              ),
      ),
    );
  }
}
