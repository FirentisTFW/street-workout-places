import 'package:app/generated/l10n.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/widgets/adaptive_button.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NavigationButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      onPressed: onPressed,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.blue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            _buildText(context),
            const Space.horizontal(4.0),
            _buildIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      S.of(context).navigationButtonTitle,
      style: AppTextStyles.content(
        color: AppColors.blue,
      ),
    );
  }

  Widget _buildIcon() {
    return const Icon(
      Icons.my_location_rounded,
      size: 30.0,
      color: AppColors.blue,
    );
  }
}
