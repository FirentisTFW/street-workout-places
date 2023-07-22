import 'package:app/domain/services/user_location_service.dart';
import 'package:app/presentation/pages/home/home_section.dart';
import 'package:app/presentation/pages/home/widgets/cubit/spots_closest_to_user_cubit.dart';
import 'package:app/presentation/pages/home/widgets/recently_added_spots_section.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user_section.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidgetFactory {
  const HomeWidgetFactory._();

  static Widget widgetFromSection(HomeSection section) {
    return switch (section) {
      final RecentlyAddedSpotsHomeSection section => RecentlyAddedSpotsHomeSectionWidget(section),
      final SpotsClosestToUserHomeSection _ => BlocProvider(
          create: (_) => SpotsClosestToUserCubit(
            locationService: UserLocationService(),
          ),
          child: const SpotsClosestToUserHomeSectionWidget(),
        ),
    };
  }
}
