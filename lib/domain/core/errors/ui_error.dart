import 'package:app/domain/core/errors/app_error.dart';
import 'package:app/domain/core/errors/error_factory.dart';
import 'package:equatable/equatable.dart';

abstract class UiError extends Equatable {
  final AppError error;

  const UiError(this.error);

  UiError.fromException(dynamic exception) : error = ErrorFactory(exception).prepare();

  @override
  List<Object?> get props => [
        error,
      ];
}

class ContainerError extends UiError {
  const ContainerError(super.error);

  ContainerError.fromException(super.exception) : super.fromException();
}

class DialogError extends UiError {
  const DialogError(super.error);

  DialogError.fromException(super.exception) : super.fromException();
}
