import 'package:app/errors/user_input/text_field_error.dart';
import 'package:app/errors/user_input/value_notifier_error.dart';

typedef TextFieldValidator = TextFieldError? Function(String);

typedef ValueNotifierValidator<T> = ValueNotifierError? Function(T);
