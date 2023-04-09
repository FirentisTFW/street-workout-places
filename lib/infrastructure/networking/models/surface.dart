import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

enum Surface {
  concrete,
  different,
  sand,
  tartan;

  String getDescription(BuildContext context) {
    switch (this) {
      case Surface.concrete:
        return S.of(context).surfaceDescriptionConcrete;
      case Surface.different:
        return S.of(context).surfaceDescriptionDifferent;
      case Surface.sand:
        return S.of(context).surfaceDescriptionSand;
      case Surface.tartan:
        return S.of(context).surfaceDescriptionTartan;
    }
  }
}
