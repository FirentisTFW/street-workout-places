import 'package:app/errors/app_error.dart';

class ErrorFactory {
  final dynamic exception;

  const ErrorFactory(this.exception);

  AppError prepare() {
    // TODO Prepare proper app error based on error
    return const UnknownError();
  }
}
