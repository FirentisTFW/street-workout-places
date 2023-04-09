import 'package:app/presentation/styles/app_padding.dart';
import 'package:flutter/material.dart';

class BasicBottomSheet {
  final BuildContext context;
  final Widget child;

  const BasicBottomSheet(
    this.context, {
    required this.child,
  });

  Future<void> show() {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (_) => SafeArea(
        child: Padding(
          padding: AppPadding.defaultAll,
          child: child,
        ),
      ),
    );
  }
}
