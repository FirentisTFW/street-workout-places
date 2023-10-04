import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/selectable_option_cell.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';

class FiltersSection<T extends Enum> extends StatelessWidget {
  final String title;
  final Map<T, ValueNotifier<bool>> optionsNotifiers;
  final String Function(T) provideDescription;

  const FiltersSection({
    super.key,
    required this.title,
    required this.optionsNotifiers,
    required this.provideDescription,
  });

  @override
  Widget build(BuildContext context) {
    // TODO Maximum of 5 elements, then expand button
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.contentBigger(),
          ),
          const Space.vertical(12.0),
          ...optionsNotifiers.entries
              .map(
                (mapEntry) => SelectableOptionCell(
                  description: provideDescription(mapEntry.key),
                  isSelectedNotifier: mapEntry.value,
                  onToggled: mapEntry.value.toggle,
                ),
              )
              .toList()
              .separatedBy(const Space.vertical(10.0)),
        ],
      ),
    );
  }
}
