// ignore_for_file: use_super_parameters

import 'package:app/errors/app_error.dart';
import 'package:app/errors/error_factory.dart';

abstract class UiError {
  final AppError error;

  const UiError(this.error);

  UiError.fromException(dynamic exception) : error = ErrorFactory(exception).prepare();
}

class ContainerError extends UiError {
  const ContainerError(super.error);

  ContainerError.fromException(dynamic exception) : super.fromException(exception);
}

class DialogError extends UiError {
  const DialogError(super.error);

  DialogError.fromException(dynamic exception) : super.fromException(exception);
}
