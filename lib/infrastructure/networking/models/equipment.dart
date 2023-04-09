// TODO Rethink name - plural or not?
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

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

  String getDescription(BuildContext context) {
    switch (this) {
      case Equipment.highBar:
        return S.of(context).equipmentDescriptionHighBar;
      case Equipment.horizontalLadder:
        return S.of(context).equipmentDescriptionHorizontalLadder;
      case Equipment.lowBar:
        return S.of(context).equipmentDescriptionLowBar;
      case Equipment.parallelBars:
        return S.of(context).equipmentDescriptionParallelBars;
      case Equipment.parkourWalls:
        return S.of(context).equipmentDescriptionParkourWalls;
      case Equipment.pole:
        return S.of(context).equipmentDescriptionPole;
      case Equipment.rings:
        return S.of(context).equipmentDescriptionRings;
      case Equipment.rope:
        return S.of(context).equipmentDescriptionRope;
      case Equipment.verticalLadder:
        return S.of(context).equipmentDescriptionVerticalLadder;
    }
  }
}
