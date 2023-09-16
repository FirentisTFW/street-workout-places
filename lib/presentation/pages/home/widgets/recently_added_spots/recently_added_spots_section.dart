import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/domain/core/common/root_navigator.dart';
import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/home/widgets/recently_added_spots/cubit/recently_added_spots_cubit.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:app/presentation/pages/spots/widgets/spot_list_cell.dart';
import 'package:app/presentation/routing/dashboard_tabs/spots_routing.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/app_progress_indicator.dart';
import 'package:app/presentation/widgets/error_view_big.dart';
import 'package:app/presentation/widgets/separator.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentlyAddedSpotsHomeSectionWidget extends StatefulWidget {
  const RecentlyAddedSpotsHomeSectionWidget();

  @override
  State<RecentlyAddedSpotsHomeSectionWidget> createState() => _RecentlyAddedSpotsHomeSectionWidgetState();
}

class _RecentlyAddedSpotsHomeSectionWidgetState
    extends BlocPageState<RecentlyAddedSpotsHomeSectionWidget, RecentlyAddedSpotsCubit> {
  @override
  void initState() {
    super.initState();
    bloc.fetchSpots();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlyAddedSpotsCubit, RecentlyAddedSpotsState>(
      builder: (_, state) {
        final child = switch (state) {
          RecentlyAddedSpotsFetchSuccessful(:final spots) => RecentlyAddedSpotsList(
              spots: spots,
            ),
          RecentlyAddedSpotsInProgress() => const SizedBox(
              height: 300,
              child: AppProgressIndicator(),
            ),
          RecentlyAddedSpotsFetchFailure() => ErrorViewBig(
              error: ContainerError.fromException(Exception()),
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              onRetryPressed: bloc.fetchSpots,
            ),
        };

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(S.of(context)),
            const Space.vertical(10.0),
            child,
          ],
        );
      },
    );
  }

  Widget _buildTitle(S s) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Text(
        s.recentlyAddedSpotsHomeSectionTitle,
        style: AppTextStyles.titleBig(),
      ),
    );
  }
}

class RecentlyAddedSpotsList extends StatelessWidget {
  const RecentlyAddedSpotsList({
    super.key,
    required this.spots,
  });

  final List<WorkoutSpotModel> spots;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final spot = spots[index];

        return SpotListCell(
          spot: spots[index],
          onPressed: () => _goToSpotDetails(context, spot),
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      itemCount: spots.length,
      separatorBuilder: (_, __) => const Separator(),
      shrinkWrap: true,
    );
  }

  void _goToSpotDetails(BuildContext context, WorkoutSpotModel spot) => RootNavigator.of(context).pushNamed(
        SpotsRouting.spotDetails,
        arguments: SpotDetailsArguments(
          spot: spot,
        ),
      );
}
