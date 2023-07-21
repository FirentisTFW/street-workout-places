import 'package:app/domain/core/common/app_images.dart';
import 'package:app/domain/core/utils/alert_dialog_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/home/home_section.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/widgets.dart';

class SpotsClosestToUserHomeSectionWidget extends StatelessWidget {
  final SpotsClosestToUserHomeSection section;

  const SpotsClosestToUserHomeSectionWidget(this.section);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(S.of(context)),
        const Space.vertical(10.0),
        // FIXME Show placeholder only when there's no location permission
        _buildMapPlaceholder(context),
      ],
    );
  }

  Widget _buildTitle(S s) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Text(
        'Najbliższe miejsca',
        style: AppTextStyles.titleBig(),
      ),
    );
  }

  Widget _buildMapPlaceholder(BuildContext context) {
    return _MapPlaceholder(
      onPressed: () {
        // FIXME Implement
        AlertDialogUtils.showContentUnavailable(context);
      },
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  const _MapPlaceholder({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  BorderRadius get _mapBorderRadius => BorderRadius.circular(AppDimensions.borderRadius.basic);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: AppPadding.defaultHorizontal * 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildMapImage(),
            _buildOverlay(),
            _buildText(),
          ],
        ),
      ),
    );
  }

  Widget _buildMapImage() {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _mapBorderRadius,
          border: Border.all(
            color: AppColors.blue,
            width: 3.0,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AppImages.mapPlaceholder.imageProvider,
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    return AdaptiveButton(
      onPressed: onPressed,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: _mapBorderRadius,
        color: AppColors.white.withAlpha(120),
      ),
      child: const SizedBox.expand(),
    );
  }

  Widget _buildText() {
    return const IgnorePointer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Chcesz zobaczyć najbliższe miejsca na mapie?\nKliknij tutaj.',
          style: TextStyle(
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
