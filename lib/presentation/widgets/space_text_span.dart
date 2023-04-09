import 'package:flutter/painting.dart';

class SpaceTextSpan extends TextSpan {
  const SpaceTextSpan({
    super.style,
  }) : super(
          text: ' ',
        );
}
