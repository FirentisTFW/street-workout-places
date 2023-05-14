import 'package:flutter/material.dart';

extension MapBoolValueNotifierExtensions<T> on Map<T, ValueNotifier<bool>> {
  List<T> takeSelectedValues() => entries
      .where(
        (mapEntry) => mapEntry.value.value,
      )
      .map(
        (mapEntry) => mapEntry.key,
      )
      .toList();
}
