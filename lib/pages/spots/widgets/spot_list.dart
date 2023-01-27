import 'package:app/models/workout_spot_model.dart';
import 'package:app/pages/spots/widgets/spot_list_cell.dart';
import 'package:app/utils/alert_dialog_utils.dart';
import 'package:app/widgets/separator.dart';
import 'package:flutter/material.dart';

class SpotList extends StatelessWidget {
  final List<WorkoutSpotModel> spots;

  const SpotList({
    required this.spots,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => SpotListCell(
        spot: spots[index],
        onPressed: () {
          // TODO Implement
          AlertDialogUtils.showContentUnavailable(context);
        },
      ),
      itemCount: spots.length,
      separatorBuilder: (_, __) => const Separator(),
    );
  }
}
