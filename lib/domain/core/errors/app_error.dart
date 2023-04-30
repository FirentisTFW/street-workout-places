import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class AppError {
  const AppError();

  String getMessage(BuildContext context);
}

class NoNetworkConnectionError extends AppError {
  const NoNetworkConnectionError();

  @override
  String getMessage(BuildContext context) => S.of(context).noNetworkConnectionErrorMessage;
}

class UnknownError extends AppError {
  const UnknownError();

  @override
  String getMessage(BuildContext context) => S.of(context).unknownErrorMessage;
}
