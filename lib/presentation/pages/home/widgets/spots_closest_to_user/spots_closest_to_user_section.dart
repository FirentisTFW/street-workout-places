import 'package:app/domain/core/common/app_images.dart';
import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user/cubit/spots_closest_to_user_cubit.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/app_progress_indicator.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpotsClosestToUserHomeSectionWidget extends StatefulWidget {
  const SpotsClosestToUserHomeSectionWidget();

  @override
  State<SpotsClosestToUserHomeSectionWidget> createState() => _SpotsClosestToUserHomeSectionWidgetState();
}

class _SpotsClosestToUserHomeSectionWidgetState
    extends BlocPageState<SpotsClosestToUserHomeSectionWidget, SpotsClosestToUserCubit> {
  @override
  void initState() {
    super.initState();
    bloc.checkPermissionAndFetchSpots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(S.of(context)),
        const Space.vertical(10.0),
        BlocBuilder<SpotsClosestToUserCubit, SpotsClosestToUserState>(
          builder: (_, state) {
            return switch (state) {
              // FIXME Build spots on the map
              SpotsClosestToUserFetchSuccessful(:final spots) => const SizedBox.shrink(),
              final SpotsClosestToUserInProgress _ => const _MapPlaceholder(
                  isLoading: true,
                ),
              // FIXME Consider different message for failure and no permission
              final SpotsClosestToUserFetchFailure _ => _MapPlaceholder(
                  isLoading: false,
                  onPressed: bloc.fetchSpots,
                ),
              final SpotsClosestToUserNoLocationPermission _ => _MapPlaceholder(
                  isLoading: false,
                  onPressed: bloc.requestLocationPermissionAndFetchSpots,
                ),
            };
          },
        ),
      ],
    );
  }

  Widget _buildTitle(S s) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Text(
        s.spotsClosestToUserHomeSectionTitle,
        style: AppTextStyles.titleBig(),
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  const _MapPlaceholder({
    required this.isLoading,
    this.onPressed,
  });

  final bool isLoading;
  final VoidCallback? onPressed;

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
            if (isLoading) _buildLoader() else _buildText(S.of(context)),
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
    final decoration = BoxDecoration(
      borderRadius: _mapBorderRadius,
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
