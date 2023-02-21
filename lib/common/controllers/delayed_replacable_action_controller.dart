import 'dart:async';

import 'package:app/common/constants.dart';
import 'package:flutter/foundation.dart';

/// A [DelayedReplacableActionController] registers a callback that is called after the given [duration].
/// Callback is registered using [replaceAction] method.
/// If, before the duration passes, [replaceAction] method gets called again,
/// currently registered callback is cancelled and the new one gets registered to be called after the [duration].
class DelayedReplacableActionController {
  final Duration duration;
  Timer? _timer;

  DelayedReplacableActionController({
    required this.duration,
  });

  DelayedReplacableActionController.withDefaultDuration() : duration = Constants.search.queryTimerReaction;

  void dispose() {
    _timer?.cancel();
  }

  void replaceAction(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(
      duration,
      action.call,
    );
  }
}
