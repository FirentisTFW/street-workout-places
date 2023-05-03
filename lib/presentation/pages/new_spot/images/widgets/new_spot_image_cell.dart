import 'dart:io';

import 'package:app/generated/l10n.dart';
import 'package:app/presentation/styles/app_animations.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class NewSpotImageCell extends StatelessWidget {
  static const double _defaultInformationCellHeight = 20.0;

  final String imagePath;
  final bool isDefault;
  final VoidCallback onRemovePressed;
  final VoidCallback onSetAsDefaultPressed;

  const NewSpotImageCell({
    super.key,
    required this.imagePath,
    required this.isDefault,
    required this.onRemovePressed,
    required this.onSetAsDefaultPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height.newSpotImageCell + _defaultInformationCellHeight / 2.0,
      width: double.infinity,
      margin: AppPadding.defaultHorizontal,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius.basic),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _buildIsDefaultInformation(context),
        ],
      ),
    );
  }

  Widget _buildIsDefaultInformation(BuildContext context) {
    final String text = isDefault ? S.of(context).newSpotImageCellDefault : S.of(context).newSpotImageCellSetAsDefault;
    final Border? border = isDefault
        ? null
        : Border.all(
            color: AppColors.blue,
          );
    final Color backgroundColor = isDefault ? AppColors.blue : AppColors.white;
    final Color textColor = isDefault ? AppColors.white : AppColors.blue;

    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: GestureDetector(
        onTap: isDefault ? null : onSetAsDefaultPressed,
        child: AnimatedContainer(
          duration: AppAnimations.regularDuration,
          height: _defaultInformationCellHeight,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(AppDimensions.borderRadius.basic),
            color: backgroundColor,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          child: Text(
            text.toUpperCase(),
            style: AppTextStyles.contentSmall(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
