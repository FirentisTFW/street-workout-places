extension StringExtensions on String {
  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => !isBlank;

  String capitalize() => isNotBlank ? '${this[0].toUpperCase()}${substring(1)}' : this;

  String removeWhitespace() => replaceAll(' ', '');

  String? takeIfNotBlank() => isNotBlank ? this : null;

  String times(int times) {
    String text = '';
    for (int i = 0; i < times; i++) {
      // ignore: use_string_buffers
      text += this;
    }
    return text;
  }
}

extension NullableStringExtensions on String? {
  bool get isNotNullOrBlank => !isNullOrBlank;

  bool get isNullOrBlank => this?.isBlank ?? true;

  String orEmpty() => this ?? '';
}
