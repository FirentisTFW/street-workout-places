import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/app_circular_checkbox.dart';
import 'package:app/presentation/widgets/ripple_remover.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';

class SelectableOptionCell extends StatelessWidget {
  final String description;
  final ValueNotifier<bool> isSelectedNotifier;
  final VoidCallback onToggled;

  const SelectableOptionCell({
    required this.description,
    super.key,
    required this.isSelectedNotifier,
    required this.onToggled,
  });

  @override
  Widget build(BuildContext context) {
    return RippleRemover(
      child: InkWell(
        onTap: onToggled,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCheckbox(),
            const Space.horizontal(10.0),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return ValueListenableBuilder(
      valueListenable: isSelectedNotifier,
      builder: (_, isSelected, __) => AppCircularCheckbox(
        value: isSelected,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      description,
      style: AppTextStyles.content(),
    );
  }
}
