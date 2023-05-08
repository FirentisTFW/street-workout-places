import 'package:app/generated/l10n.dart';

abstract class AppError {
  const AppError();

  String getMessage(S s);
}

class NoNetworkConnectionError extends AppError {
  const NoNetworkConnectionError();

  @override
  String getMessage(S s) => s.noNetworkConnectionErrorMessage;
}

class UnknownError extends AppError {
  const UnknownError();

  @override
  String getMessage(S s) => s.unknownErrorMessage;
}
