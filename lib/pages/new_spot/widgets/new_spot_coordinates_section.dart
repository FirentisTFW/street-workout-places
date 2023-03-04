import 'package:app/generated/l10n.dart';
import 'package:app/pages/new_spot/new_spot_cubit.dart';
import 'package:app/widgets/app_text_field.dart';
import 'package:app/widgets/primary_button.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';

class NewSpotCoordinatesSection extends StatelessWidget {
  final NewSpotCubit bloc;

  const NewSpotCoordinatesSection({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildCoordinatesTextFields(context),
            ),
            const Space.horizontal(20.0),
            Expanded(
              child: _buildMiniMap(),
            ),
          ],
        ),
        const Space.vertical(20.0),
        _buildSelectOnTheMapButton(context),
      ],
    );
  }

  Widget _buildCoordinatesTextFields(BuildContext context) {
    return Column(
      children: [
        _buildLatitudeTextField(context),
        const Space.vertical(20.0),
        _buildLongitudeTextField(context),
      ],
    );
  }

  Widget _buildLatitudeTextField(BuildContext context) {
    return AppTextField(
      bloc.latitudeTFE,
      labelText: S.of(context).latitudeShort,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildLongitudeTextField(BuildContext context) {
    return AppTextField(
      bloc.longitudeTFE,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      labelText: S.of(context).longitudeShort,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildMiniMap() {
    // FIXME Implement
    return const SizedBox.shrink();
  }

  Widget _buildSelectOnTheMapButton(BuildContext context) {
    return PrimaryButton(
      S.of(context).newSpotCoordinatesSectionButtonTitle,
      onPressed: () {
        // FIXME Open map page
      },
    );
  }
}
