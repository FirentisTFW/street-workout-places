import 'package:app/domain/core/extensions/iterable_extensions.dart';
import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget withSliverToBoxAdapter() => SliverToBoxAdapter(
        child: this,
      );
}

extension WidgetListExtensions on List<Widget> {
  List<Widget> eachElementFollowedBy(Widget followingWidget) => copy()
      .expand(
        (element) => [
          element,
          followingWidget,
        ],
      )
      .toList();

  List<Widget> separatedAndSurroundedBy(Widget separator) => expand(
        (element) => [
          element,
          separator,
        ],
      ).toList()
        ..insert(0, separator);

  List<Widget> separatedBy(Widget separator) => copy()
      .expand(
        (element) => [
          element,
          separator,
        ],
      )
      .toList()
    ..removeLast();
}
