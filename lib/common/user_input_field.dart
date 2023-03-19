abstract class UserInputField {
  bool shouldForceDisplayingError = false;

  void dispose();

  String? provideErrorMessage();

  bool validate();
}
