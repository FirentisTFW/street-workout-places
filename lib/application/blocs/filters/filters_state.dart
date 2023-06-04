part of 'filters_cubit.dart';

@CopyWith()
class FiltersState extends Equatable {
  final Filters filters;
  final MapPosition? userPosition;

  bool get hasFiltersSelected => selectedFiltersCount > 0;

  int get selectedFiltersCount => filters.count;

  const FiltersState({
    required this.filters,
    this.userPosition,
  });

  const FiltersState.empty()
      : filters = const Filters.empty(),
        userPosition = null;

  FiltersState updateQuery(String? query) => copyWith.filters(
        filters.copyWith.query(query),
      );

  @override
  List<Object?> get props => [
        filters,
        userPosition,
        UniquePropProvider.get(),
      ];
}
