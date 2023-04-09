import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/app_circular_checkbox.dart';
import 'package:app/presentation/widgets/ripple_remover.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';

class EquipmentCell extends StatelessWidget {
  final Equipment equipment;
  final ValueNotifier<bool> isSelectedNotifier;
  final VoidCallback onToggled;

  const EquipmentCell(
    this.equipment, {
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
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return AppCircularCheckbox(
      isSelectedNotifier: isSelectedNotifier,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      equipment.getDescription(context),
      style: AppTextStyles.content(),
    );
  }
}
