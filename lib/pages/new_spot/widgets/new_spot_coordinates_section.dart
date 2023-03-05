import 'package:app/generated/l10n.dart';
import 'package:app/pages/new_spot/new_spot_cubit.dart';
import 'package:app/utils/alert_dialog_utils.dart';
import 'package:app/widgets/primary_button.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';

class NewSpotCoordinatesSection extends StatelessWidget {
  final NewSpotCubit bloc;

  bool get _shouldDisplayMap => bloc.position != null;

  const NewSpotCoordinatesSection({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_shouldDisplayMap) ...[
          _buildMiniMap(),
          const Space.vertical(20.0),
        ],
        _buildSelectOnTheMapButton(context),
      ],
    );
  }

  Widget _buildMiniMap() {
    return const SizedBox.shrink();
  }

  Widget _buildSelectOnTheMapButton(BuildContext context) {
    return PrimaryButton(
      S.of(context).newSpotCoordinatesSectionButtonTitle,
      onPressed: () {
        // FIXME Open map page
        AlertDialogUtils.showContentUnavailable(context);
      },
    );
  }
}
