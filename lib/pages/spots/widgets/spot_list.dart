import 'package:app/models/workout_spot_model.dart';
import 'package:app/pages/spots/widgets/spot_list_cell.dart';
import 'package:app/widgets/separator.dart';
import 'package:flutter/material.dart';

class SpotList extends StatelessWidget {
  final List<WorkoutSpotModel> spots;
  final void Function(WorkoutSpotModel) onSpotPressed;

  const SpotList({
    super.key,
    required this.spots,
    required this.onSpotPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return SpotListCell(
          spot: spots[index],
          onPressed: () => onSpotPressed(spots[index]),
        );
      },
      itemCount: spots.length,
      separatorBuilder: (_, __) => const Separator(),
    );
  }
}
