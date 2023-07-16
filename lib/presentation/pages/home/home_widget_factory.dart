import 'package:app/presentation/pages/home/home_section.dart';
import 'package:app/presentation/pages/home/widgets/recently_added_spots_section.dart';
import 'package:app/presentation/pages/home/widgets/spots_closest_to_user_section.dart';
import 'package:flutter/widgets.dart';

class HomeWidgetFactory {
  const HomeWidgetFactory._();

  static Widget widgetFromSection(HomeSection section) {
    return switch (section) {
      final RecentlyAddedSpotsHomeSection section => RecentlyAddedSpotsHomeSectionWidget(section),
      final SpotsClosestToUserHomeSection section => SpotsClosestToUserHomeSectionWidget(section),
    };
  }
}
