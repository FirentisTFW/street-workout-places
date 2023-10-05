import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/core/utils/map_utils.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/presentation/pages/new_review/new_review_arguments.dart';
import 'package:app/presentation/pages/spot_details/spot_details_cubit.dart';
import 'package:app/presentation/pages/spot_details/widgets/spot_details_image_slider.dart';
import 'package:app/presentation/pages/spot_details/widgets/spot_details_reviews_section.dart';
import 'package:app/presentation/routing/dashboard_tabs/spots_routing.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/circular_button.dart';
import 'package:app/presentation/widgets/information_with_title.dart';
import 'package:app/presentation/widgets/navigation_button.dart';
import 'package:app/presentation/widgets/separator.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpotDetailsPage extends StatefulWidget {
  const SpotDetailsPage();

  @override
  State<SpotDetailsPage> createState() => _SpotDetailsPageState();
}

class _SpotDetailsPageState extends BlocPageState<SpotDetailsPage, SpotDetailsCubit> {
  @override
  void initState() {
    super.initState();
    bloc.fetchReviews();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotDetailsCubit, SpotDetailsState>(
      builder: (_, state) {
        return Scaffold(
          body: Stack(
            children: [
              _buildLoadedBody(state),
              Positioned(
                top: 2.0,
                left: 2.0,
                child: _buildBackArrow(),
              ),
            ],
          ),
          floatingActionButton: _buildNewReviewButton(state.spot),
        );
      },
    );
  }

  Widget _buildBackArrow() {
    return SafeArea(
      child: CircularButton(
        color: AppColors.white,
        circleSize: 40.0,
        onPressed: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.blue,
          size: 28.0,
        ),
      ),
    );
  }

  Widget _buildLoadedBody(SpotDetailsState state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSlider(state.spot),
          const Space.vertical(20.0),
          _buildInformationSection(state),
          const Space.vertical(20.0),
        ],
      ),
    );
  }

  Widget _buildNewReviewButton(WorkoutSpotModel spot) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () {
        // TODO Reconsider those nullable types
        final spotId = spot.id;
        if (spotId == null) return;
        _goToNewReviewPage(spotId);
      },
      child: Icon(
        Icons.reviews_rounded,
        size: AppDimensions.size.floatingActionButtonIcon,
      ),
    );
  }

  Widget _buildInformationSection(SpotDetailsState state) {
    final spot = state.spot;

    return Padding(
      padding: AppPadding.defaultHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameAndAddressSection(spot),
          const Separator.ofHeight(2.0),
          _buildSizeAndSurface(spot),
          _buildDescription(spot),
          _buildEquipment(spot),
          SpotDetailsReviewsSection(
            reviewsState: state.reviewsState,
          ),
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
        Flexible(
          child: Column(
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
        ),
        const Space.horizontal(4.0),
        NavigationButton(
          onPressed: () => _launchMapAndNavigation(spot),
        ),
      ],
    );
  }

  Widget _buildSizeAndSurface(WorkoutSpotModel spot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (spot.size case final size?)
          InformationWithTitle(
            value: size.getDescription(S.of(context)),
            title: S.of(context).size,
          ),
        if (spot.surface case final surface?)
          InformationWithTitle(
            value: surface.getDescription(S.of(context)),
            title: S.of(context).surface,
          ),
      ].separatedBy(
        const Space.vertical(8.0),
      ),
    );
  }

  Widget _buildDescription(WorkoutSpotModel spot) {
    return _buildContentSection(
      title: S.of(context).description,
      description: spot.description.orEmpty(),
    );
  }

  Widget _buildEquipment(WorkoutSpotModel spot) {
    return _buildContentSection(
      title: S.of(context).equipment,
      description: spot.getEquipmentDescription(
        context,
        multiline: true,
      ),
    );
  }

  Widget _buildContentSection({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.titleSmall(),
        ),
        const Space.vertical(6.0),
        Text(
          description,
          style: AppTextStyles.contentMultiline(),
        ),
      ],
    );
  }

  void _goToNewReviewPage(int spotId) {
    Navigator.of(context).pushNamed(
      SpotsRouting.newReview,
      arguments: NewReviewArguments(
        spotId: spotId,
      ),
    );
  }

  void _launchMapAndNavigation(WorkoutSpotModel spot) {
    final MapPosition? coordinates = spot.coordinates;
    if (coordinates == null) return;
    MapUtils.openMapAndLaunchNavigation(
      position: coordinates,
    );
  }
}
