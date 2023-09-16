import 'package:app/application/blocs/spots/spots_cubit.dart';
import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/domain/services/spots_filtering_service.dart';
import 'package:app/domain/services/user_location_service.dart';
import 'package:app/presentation/pages/home/home_section.dart';
import 'package:app/presentation/pages/home/widgets/recently_added_spots/cubit/recently_added_spots_cubit.dart';
import 'package:app/presentation/pages/home/widgets/recently_added_spots/recently_added_spots_section.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user/cubit/spots_closest_to_user_cubit.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user/spots_closest_to_user_section.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class HomeWidgetFactory {
  const HomeWidgetFactory._();

  static Widget widgetFromSection(BuildContext context, HomeSection section) {
    return switch (section) {
      final RecentlyAddedSpotsHomeSection _ => BlocProvider(
          create: (_) => RecentlyAddedSpotsCubit(),
          child: const RecentlyAddedSpotsHomeSectionWidget(),
        ),
      final SpotsClosestToUserHomeSection _ => BlocProvider(
          create: (_) => SpotsClosestToUserCubit(
            filteringService: SpotsFilteringService(),
            mapCoordinator: MapCoordinator.create(),
            spotsCubit: BlocProvider.of<SpotsCubit>(context),
            userLocationService: UserLocationService(),
          ),
          child: const SpotsClosestToUserHomeSectionWidget(),
        ),
    };
  }
}
