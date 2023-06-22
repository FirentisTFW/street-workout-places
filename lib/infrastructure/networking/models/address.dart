import 'package:app/domain/core/extensions/extensions.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? city;
  final String? houseNumber;
  final String? street;

  const Address({
    this.city,
    this.houseNumber,
    this.street,
  });

  String? get _streetWithHouseNumber => street.isNotNullOrBlank ? '$street ${houseNumber.orEmpty()}'.trim() : null;

  String get fullAddress => [
        city,
        _streetWithHouseNumber,
      ].filterNotNull().join(', ');

  @override
  List<Object?> get props => [
        city,
        houseNumber,
        street,
      ];
}
