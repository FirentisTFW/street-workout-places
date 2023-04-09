import 'package:flutter/material.dart';

class AutomaticKeepAliveClientContainer extends StatefulWidget {
  final Widget child;

  const AutomaticKeepAliveClientContainer({
    super.key,
    required this.child,
  });

  @override
  _AutomaticKeepAliveClientContainerState createState() => _AutomaticKeepAliveClientContainerState();
}

class _AutomaticKeepAliveClientContainerState extends State<AutomaticKeepAliveClientContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
