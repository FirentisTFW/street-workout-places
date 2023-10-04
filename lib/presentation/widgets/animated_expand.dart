import 'package:flutter/material.dart';

class AnimatedExpand extends StatefulWidget {
  final Axis axis;
  final Widget child;
  final Duration duration;
  final bool isExpanded;

  const AnimatedExpand({
    this.axis = Axis.vertical,
    required this.child,
    required this.duration,
    required this.isExpanded,
  });

  @override
  _AnimatedExpandState createState() => _AnimatedExpandState();
}

class _AnimatedExpandState extends State<AnimatedExpand> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    if (widget.isExpanded) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(AnimatedExpand oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: widget.axis,
      sizeFactor: _controller,
      child: widget.child,
    );
  }
}
