import 'package:app/common/bloc_page_state.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/models/workout_spot_model.dart';
import 'package:app/pages/spot_details/spot_details_bloc.dart';
import 'package:app/pages/spot_details/widgets/spot_details_image_slider.dart';
import 'package:app/styles/app_padding.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/utils/alert_dialog_utils.dart';
import 'package:app/widgets/navigation_button.dart';
import 'package:app/widgets/separator.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpotDetailsPage extends StatefulWidget {
  const SpotDetailsPage();

  @override
  State<SpotDetailsPage> createState() => _SpotDetailsPageState();
}

class _SpotDetailsPageState extends BlocPageState<SpotDetailsPage, SpotDetailsBloc> {
  // FIXME Add navigate button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SpotDetailsBloc, SpotDetailsState>(
        builder: (_, state) {
          return state.maybeWhen(
            initial: _buildLoadedBody,
            orElse: buildLoadingBody,
          );
        },
      ),
    );
  }

  Widget _buildLoadedBody(WorkoutSpotModel spot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageSlider(spot),
        const Space.vertical(20.0),
        _buildInformationSection(spot),
      ],
    );
  }

  Widget _buildInformationSection(WorkoutSpotModel spot) {
    return Padding(
      padding: AppPadding.defaultHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameAndAddressSection(spot),
          const Separator.ofHeight(2.0),
          _buildDescription(spot),
          _buildEquipment(spot),
          // _buildReviews(),
        ].separatedBy(
          const Space.vertical(20.0),
        ),
      ),
    );
  }

  Widget _buildImageSlider(WorkoutSpotModel spot) {
    return SpotDetailsImageSlider(
      images: spot.images,
    );
  }

  Widget _buildNameAndAddressSection(WorkoutSpotModel spot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              spot.name.orEmpty(),
              style: AppTextStyles.titleBig(),
            ),
            const Space.vertical(8.0),
            Text(
              (spot.address?.fullAddress).orEmpty(),
              style: AppTextStyles.addressBig(),
            ),
          ],
        ),
        NavigationButton(
          onPressed: () {
            // TODO Implement
            AlertDialogUtils.showContentUnavailable(context);
          },
        ),
      ],
    );
  }

  Widget _buildDescription(WorkoutSpotModel spot) {
    return Text(
      spot.description.orEmpty(),
      style: AppTextStyles.contentMultiline(),
    );
  }

  Widget _buildEquipment(WorkoutSpotModel spot) {
    return Text(
      spot.getEquipmentDescription(
        context,
        multiline: true,
      ),
      style: AppTextStyles.contentMultiline(),
    );
  }
}
