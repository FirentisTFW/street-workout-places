import 'package:app/presentation/pages/home/home_section.dart';
import 'package:flutter/widgets.dart';

class HomeWidgetFactory {
  const HomeWidgetFactory._();

  static Widget widgetFromSection(HomeSection section) {
    return switch (section) {
      // FIXME Create custom widgets for sections
      final RecentlyAddedSpotsHomeSection section => const SizedBox.shrink(),
      final SpotsClosestToUserHomeSection section => const SizedBox.shrink(),
    };
  }
}
