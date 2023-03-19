import 'package:app/errors/text_field_error.dart';
import 'package:app/errors/value_notifier_error.dart';

typedef TextFieldValidator = TextFieldError? Function(String);

typedef ValueNotifierValidator<T> = ValueNotifierError? Function(T);
