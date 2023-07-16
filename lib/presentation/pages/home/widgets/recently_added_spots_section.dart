import 'package:app/domain/core/utils/alert_dialog_utils.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/home/home_section.dart';
import 'package:app/presentation/pages/spots/widgets/spot_list_cell.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/separator.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/widgets.dart';

class RecentlyAddedSpotsHomeSectionWidget extends StatelessWidget {
  final RecentlyAddedSpotsHomeSection section;

  List<WorkoutSpotModel> get spots => section.spots;

  const RecentlyAddedSpotsHomeSectionWidget(this.section);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(S.of(context)),
        const Space.vertical(10.0),
        _buildSpotList(context),
      ],
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

  Widget _buildSpotList(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        // FIXME Adjust cell (description or equipment?)
        return SpotListCell(
          spot: spots[index],
          onPressed: () {
            // FIXME Implement
            AlertDialogUtils.showContentUnavailable(context);
          },
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      itemCount: spots.length,
      separatorBuilder: (_, __) => const Separator(),
      shrinkWrap: true,
    );
  }
}
