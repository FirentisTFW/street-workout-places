import 'package:app/domain/core/common/app_images.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/app_progress_indicator.dart';
import 'package:flutter/widgets.dart';

class SpotsClosestToUserMapPlaceholder extends StatelessWidget {
  const SpotsClosestToUserMapPlaceholder({
    required this.isLoading,
    this.onPressed,
  });

  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildMapImage(),
          _buildOverlay(),
          if (isLoading) _buildLoader() else _buildText(S.of(context)),
        ],
      ),
    );
  }

  Widget _buildMapImage() {
    return Image(
      height: double.infinity,
      fit: BoxFit.fitHeight,
      image: AppImages.mapPlaceholder.imageProvider,
    );
  }

  Widget _buildOverlay() {
    final decoration = BoxDecoration(
      color: AppColors.white.withAlpha(120),
    );

    if (onPressed case final onPressed?) {
      return AdaptiveButton(
        onPressed: onPressed,
        height: double.infinity,
        decoration: decoration,
        child: const SizedBox.expand(),
      );
    }

    return Container(
      decoration: decoration,
    );
  }

  Widget _buildLoader() {
    return const AppProgressIndicator();
  }

  Widget _buildText(S s) {
    return IgnorePointer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          s.spotsClosestToUserHomeSectionMapPlaceholderTitle,
          style: const TextStyle(
            fontSize: 18.0,
            height: 1.4,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
