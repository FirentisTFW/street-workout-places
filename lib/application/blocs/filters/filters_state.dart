part of 'filters_cubit.dart';

class FiltersState extends Equatable {
  final Filters filters;

  const FiltersState({
    required this.filters,
  });

  const FiltersState.empty() : filters = const Filters.empty();

  @override
  List<Object?> get props => [
        filters,
      ];
}
