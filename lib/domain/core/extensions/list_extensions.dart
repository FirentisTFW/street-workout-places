extension ListExtensions<T> on List<T> {
  List<T> copy() => [
        ...this,
      ];
}

extension NullableListExtensions<T> on List<T>? {
  bool get isNotNullOrEmpty => orEmpty().isNotEmpty;

  List<T> orEmpty() => this ?? [];
}

extension ListWithNullableValuesExtensions<T> on List<T?> {
  List<T> filterNotNull() => copy().whereType<T>().toList();
}
