extension IterableExtensions<T> on Iterable<T> {
  Iterable<T> copy() => [
        ...this,
      ];

  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    int index = 0;
    for (final element in this) {
      yield convert(index++, element);
    }
  }

  Iterable<T> updateWhere<R>({
    required bool Function(T e) where,
    required T Function(T e) update,
  }) =>
      map(
        (element) => where(element) ? update(element) : element,
      );
}

extension NullableIterableExtensions<T> on Iterable<T>? {
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);

  Iterable<T> orEmpty() => this ?? [];
}

extension IterableWithNullableValuesExtensions<T> on Iterable<T?> {
  Iterable<T> filterNotNull() => copy().whereType<T>();
}
