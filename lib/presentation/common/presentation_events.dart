import 'package:app/domain/core/errors/ui_error.dart';
import 'package:bloc_presentation/bloc_presentation.dart';

class ValidationFailed implements BlocPresentationEvent {
  final DialogError error;

  const ValidationFailed({
    required this.error,
  });
}
