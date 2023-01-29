import 'package:app/extensions/extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/widgets/adaptive_button.dart';
import 'package:app/widgets/app_network_image.dart';
import 'package:app/widgets/space.dart';
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
            _buildRightSection(),
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
      style: AppTextStyles.spotTitle(),
    );
  }

  Widget _buildAddress() {
    return Text(
      (spot.address?.fullAddress).orEmpty(),
      style: AppTextStyles.informationSecondary(),
    );
  }

  Widget _buildSize(BuildContext context) {
    final String? size = spot.size?.getDescription(context);
    if (size == null) return const SizedBox.shrink();
    return Text(
      S.of(context).size(size),
      style: AppTextStyles.content(),
    );
  }

  Widget _buildEquipment(BuildContext context) {
    return Text(
      spot.getEquipmentDescription(context),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildDistanceFromUser(),
        const Space.vertical(12.0),
        _buildPhoto(),
      ],
    );
  }

  Widget _buildDistanceFromUser() {
    // TODO Remove mocks
    return Text(
      '1,2 km',
      style: AppTextStyles.spotTitle(),
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
