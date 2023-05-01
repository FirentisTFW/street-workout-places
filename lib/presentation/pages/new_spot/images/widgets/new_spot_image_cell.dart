import 'dart:io';

import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:flutter/material.dart';

class NewSpotImageCell extends StatelessWidget {
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
      height: AppDimensions.height.newSpotImageCell,
      width: double.infinity,
      margin: AppPadding.defaultHorizontal,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius.basic),
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
