import 'package:flutter/widgets.dart';

/// The [AnimatedInterpolation] class provides a convenient way to perform an
/// interpolation between a start and end value over a specified animation duration.
///
/// It interpolates values between [startValue] and [endValue]
/// over the animation duration, periodically invoking the [interpolate] method
/// which contains the interpolation algorithm. The result of the interpolation
/// is then passed to the [action] callback for further processing.
class AnimatedInterpolation<T> {
  AnimatedInterpolation({
    required this.animation,
    required this.startValue,
    required this.endValue,
    required this.interpolate,
    required this.action,
    required this.onCompleted,
  }) {
    animation.addListener(_listener);
  }

  final Animation<double> animation;
  final T startValue;
  final T endValue;
  final T Function(T start, T end, double value) interpolate;
  final void Function(T value) action;
  final VoidCallback onCompleted;

  void cancel() {
    animation.removeListener(_listener);
    onCompleted();
  }

  void _listener() {
    final interpolationResult = interpolate(startValue, endValue, animation.value);

    action(interpolationResult);

    if (animation.isCompleted) {
      cancel();
    }
  }
}
