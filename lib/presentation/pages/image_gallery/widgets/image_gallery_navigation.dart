import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class ImageGalleryNavigation extends StatelessWidget {
  final int currentItemPosition;
  final int itemsCount;
  final VoidCallback onLeftArrowPressed;
  final VoidCallback onRightArrowPressed;

  const ImageGalleryNavigation({
    required this.currentItemPosition,
    required this.itemsCount,
    required this.onLeftArrowPressed,
    required this.onRightArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.defaultHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeftArrow(),
          _buildCurrentlySelectedItemPosition(),
          _buildRightArrow(),
        ],
      ),
    );
  }

  Widget _buildLeftArrow() {
    return _buildIcon(
      Icons.arrow_circle_left_outlined,
      onPressed: onLeftArrowPressed,
    );
  }

  Widget _buildIcon(
    IconData icon, {
    required VoidCallback onPressed,
  }) {
    return CircularButton(
      circleSize: 48.0,
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 28.0,
      ),
    );
  }

  Widget _buildCurrentlySelectedItemPosition() {
    return Text(
      '$currentItemPosition/$itemsCount',
      style: AppTextStyles.contentBigger(),
    );
  }

  Widget _buildRightArrow() {
    return _buildIcon(
      Icons.arrow_circle_right_outlined,
      onPressed: onRightArrowPressed,
    );
  }
}
