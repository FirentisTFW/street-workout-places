import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user/cubit/spots_closest_to_user_cubit.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user/spots_closest_to_user_map.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user/spots_closest_to_user_map_placeholder.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
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
  MapCoordinator get _mapCoordinator => bloc.mapCoordinator;

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
          builder: (_, state) => _MapWrapper(
            child: switch (state) {
              final SpotsClosestToUserFetchSuccessful state => SpotsClosestToUserMap(
                  state,
                  mapCoordinator: _mapCoordinator,
                ),
              final SpotsClosestToUserInProgress _ => const SpotsClosestToUserMapPlaceholder(
                  isLoading: true,
                ),
              // TODO Consider different message for failure and no permission
              final SpotsClosestToUserFetchFailure _ => SpotsClosestToUserMapPlaceholder(
                  isLoading: false,
                  onPressed: bloc.fetchSpots,
                ),
              final SpotsClosestToUserNoLocationPermission _ => SpotsClosestToUserMapPlaceholder(
                  isLoading: false,
                  onPressed: bloc.requestLocationPermissionAndFetchSpots,
                ),
            },
          ),
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

class _MapWrapper extends StatelessWidget {
  const _MapWrapper({
    required this.child,
  });

  final Widget? child;

  BorderRadius get _mapBorderRadius => BorderRadius.circular(AppDimensions.borderRadius.basic);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.0,
      margin: AppPadding.defaultHorizontal * 2,
      decoration: BoxDecoration(
        borderRadius: _mapBorderRadius,
        border: Border.all(
          color: AppColors.blue,
          width: 3.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: _mapBorderRadius,
        child: child,
      ),
    );
  }
}
