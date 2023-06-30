import 'package:app/presentation/styles/app_animations.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/widgets/app_network_image.dart';
import 'package:app/presentation/widgets/app_progress_indicator.dart';
import 'package:flutter/widgets.dart';

class ImageGallerySliderItem extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onPressed;

  const ImageGallerySliderItem({
    required this.imageUrl,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        height: AppDimensions.height.imageGalleryListItem,
        width: AppDimensions.width.imageGalleryListItem,
        duration: AppAnimations.regularDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          border: isSelected
              ? Border.all(
                  width: 4.0,
                  color: AppColors.blue,
                )
              : null,
        ),
        child: AppNetworkImage(
          imageUrl,
          fit: BoxFit.cover,
          placeholder: const Padding(
            padding: EdgeInsets.all(8.0),
            child: AppProgressIndicator(
              strokeWidth: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
