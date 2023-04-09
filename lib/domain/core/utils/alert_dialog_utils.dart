import 'dart:io';

import 'package:app/domain/core/common/global_navigator.dart';
import 'package:app/domain/core/common/root_navigator.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/injector.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AlertDialogUtils {
  const AlertDialogUtils._();

  static Future<void> showContentUnavailable(BuildContext context) {
    return _show(
      context,
      message: S.of(context).contentUnavailableDialogMessage,
      title: S.of(context).contentUnavailableDialogTitle,
    );
  }

  static Future<void> _show(
    BuildContext context, {
    List<Widget>? actions,
    bool barrierDismissible = true,
    String? message,
    String? title,
  }) {
    final Widget? titleWidget = _buildTitle(title);
    final Widget? contentWidget = _buildContent(message);
    final List<Widget> actionsWidgets = actions?.isEmpty ?? true
        ? [
            _buildDefaultAction(context),
          ]
        : actions!;

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            actions: actionsWidgets,
            content: contentWidget,
            title: Padding(
              padding: const EdgeInsets.only(
                bottom: 4.0,
              ),
              child: titleWidget,
            ),
          );
        }
        return AlertDialog(
          actions: actionsWidgets,
          content: contentWidget,
          title: titleWidget,
          contentPadding: AppPadding.defaultAll,
        );
      },
    );
  }

  static Widget? _buildTitle(String? title) {
    if (title == null) return null;
    return Text(
      title,
      style: AppTextStyles.titleSmall(),
      textAlign: TextAlign.center,
    );
  }

  static Widget? _buildContent(String? content) {
    if (content == null) return null;
    return Text(
      content,
      style: AppTextStyles.contentMultiline(),
      textAlign: TextAlign.center,
    );
  }

  static Widget _buildDefaultAction(
    BuildContext context, {
    String? title,
  }) {
    return _buildAction(
      text: title ?? S.of(context).ok,
      onPressed: () {
        final BuildContext? currentContext = Injector().resolve<GlobalNavigator>().currentContext;
        RootNavigator.of(currentContext ?? context).pop();
      },
    );
  }

  static Widget _buildAction({
    required VoidCallback onPressed,
    required String text,
  }) {
    if (text.isEmpty) return const SizedBox.shrink();
    final Widget child = Text(
      text.toUpperCase(),
      style: AppTextStyles.content(),
      textAlign: TextAlign.center,
    );
    if (Platform.isIOS) {
      return CupertinoDialogAction(
        onPressed: onPressed,
        child: child,
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.blue,
        ),
        child: child,
      );
    }
  }
}
