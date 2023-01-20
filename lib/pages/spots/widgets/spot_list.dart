import 'package:app/extensions/extensions.dart';
import 'package:app/models/workout_spot_model.dart';
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
      itemBuilder: (_, index) {
        // TODO Add and style spot cell
        return Text(spots[index].name.orEmpty());
      },
      itemCount: spots.length,
      separatorBuilder: (_, __) => const Separator(),
    );
  }
}
