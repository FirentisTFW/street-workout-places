// TODO Rethink name - plural or not?
import 'package:app/generated/l10n.dart';

enum Equipment {
  highBar,
  horizontalLadder,
  lowBar,
  parallelBars,
  parkourWalls,
  pole,
  rings,
  rope,
  verticalLadder;

  String getDescription(S s) {
    switch (this) {
      case Equipment.highBar:
        return s.equipmentDescriptionHighBar;
      case Equipment.horizontalLadder:
        return s.equipmentDescriptionHorizontalLadder;
      case Equipment.lowBar:
        return s.equipmentDescriptionLowBar;
      case Equipment.parallelBars:
        return s.equipmentDescriptionParallelBars;
      case Equipment.parkourWalls:
        return s.equipmentDescriptionParkourWalls;
      case Equipment.pole:
        return s.equipmentDescriptionPole;
      case Equipment.rings:
        return s.equipmentDescriptionRings;
      case Equipment.rope:
        return s.equipmentDescriptionRope;
      case Equipment.verticalLadder:
        return s.equipmentDescriptionVerticalLadder;
    }
  }
}
