import 'package:app/domain/core/extensions/iterable_extensions.dart';

extension NullableListExtensions<T> on List<T>? {
  bool get isNotNullOrEmpty => orEmpty().isNotEmpty;

  List<T> orEmpty() => this ?? [];
}

extension ListWithNullableValuesExtensions<T> on List<T?> {
  List<T> filterNotNull() => copy().whereType<T>().toList();
}
