part of 'filters_cubit.dart';

@CopyWith()
class FiltersState extends Equatable {
  final Filters filters;

  bool get hasFiltersSelected => selectedFiltersCount > 0;

  int get selectedFiltersCount => filters.count;

  const FiltersState({
    required this.filters,
  });

  const FiltersState.empty() : filters = const Filters.empty();

  FiltersState updateQuery(String? query) => copyWith.filters(
        filters.copyWith.query(query),
      );

  @override
  List<Object?> get props => [
        filters,
        UniquePropProvider.get(),
      ];
}
