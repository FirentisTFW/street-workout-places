import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    String? city,
    String? houseNumber,
    String? street,
  }) = _Address;

  const Address._();
}
