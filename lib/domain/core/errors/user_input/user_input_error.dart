import 'package:flutter/material.dart';

abstract class UserInputError {
  const UserInputError();

  String getMessage(BuildContext context);
}
