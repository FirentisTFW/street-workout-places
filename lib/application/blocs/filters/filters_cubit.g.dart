// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FiltersStateCWProxy {
  FiltersState filters(Filters filters);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiltersState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiltersState(...).copyWith(id: 12, name: "My name")
  /// ````
  FiltersState call({
    Filters? filters,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFiltersState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFiltersState.copyWith.fieldName(...)`
class _$FiltersStateCWProxyImpl implements _$FiltersStateCWProxy {
  const _$FiltersStateCWProxyImpl(this._value);

  final FiltersState _value;

  @override
  FiltersState filters(Filters filters) => this(filters: filters);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiltersState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiltersState(...).copyWith(id: 12, name: "My name")
  /// ````
  FiltersState call({
    Object? filters = const $CopyWithPlaceholder(),
  }) {
    return FiltersState(
      filters: filters == const $CopyWithPlaceholder() || filters == null
          ? _value.filters
          // ignore: cast_nullable_to_non_nullable
          : filters as Filters,
    );
  }
}

extension $FiltersStateCopyWith on FiltersState {
  /// Returns a callable class that can be used as follows: `instanceOfFiltersState.copyWith(...)` or like so:`instanceOfFiltersState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiltersStateCWProxy get copyWith => _$FiltersStateCWProxyImpl(this);
}
