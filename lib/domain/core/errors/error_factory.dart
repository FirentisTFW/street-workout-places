import 'package:app/domain/core/errors/app_error.dart';

class ErrorFactory {
  final dynamic exception;

  const ErrorFactory(this.exception);

  AppError prepare() {
    final dynamic exception = this.exception;
    // TODO Prepare proper app error based on exception
    if (exception is AppError) {
      return exception;
    }
    return const UnknownError();
  }
}
