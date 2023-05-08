import 'package:app/generated/l10n.dart';

enum Surface {
  concrete,
  different,
  sand,
  tartan;

  String getDescription(S s) {
    switch (this) {
      case Surface.concrete:
        return s.surfaceDescriptionConcrete;
      case Surface.different:
        return s.surfaceDescriptionDifferent;
      case Surface.sand:
        return s.surfaceDescriptionSand;
      case Surface.tartan:
        return s.surfaceDescriptionTartan;
    }
  }
}
