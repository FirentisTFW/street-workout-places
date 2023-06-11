import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/app_network_image.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';

class SpotListCell extends StatelessWidget {
  final WorkoutSpotModel spot;
  final VoidCallback onPressed;

  const SpotListCell({
    required this.spot,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      height: double.infinity,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLeftSection(context),
            ),
            const Space.horizontal(4.0),
            _buildRightSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildName(),
        const Space.vertical(4.0),
        _buildAddress(),
        const Space.vertical(8.0),
        _buildSize(context),
        const Space.vertical(4.0),
        _buildEquipment(context),
      ],
    );
  }

  Widget _buildName() {
    return Text(
      spot.name.orEmpty(),
      style: AppTextStyles.titleSmall(),
    );
  }

  Widget _buildAddress() {
    return Text(
      (spot.address?.fullAddress).orEmpty(),
      style: AppTextStyles.addressSmall(),
    );
  }

  Widget _buildSize(BuildContext context) {
    final String? size = spot.size?.getDescription(S.of(context));
    if (size == null) return const SizedBox.shrink();
    return Text(
      S.of(context).sizeSelected(size),
      style: AppTextStyles.content(),
    );
  }

  Widget _buildEquipment(BuildContext context) {
    return Text(
      spot.getEquipmentDescription(context),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.content(height: 1.2),
    );
  }

  Widget _buildRightSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (spot.distanceFromUserInKm case final double distanceFromUserInKm?)
          Text(
            S.of(context).spotListCellDistanceFromUserInKm(distanceFromUserInKm),
            style: AppTextStyles.titleSmall(),
          ),
        const Space.vertical(12.0),
        _buildPhoto(),
      ],
    );
  }

  Widget _buildPhoto() {
    return AppNetworkImage(
      spot.primaryImage,
      height: 70.0,
      width: 90.0,
      fit: BoxFit.cover,
    );
  }
}
