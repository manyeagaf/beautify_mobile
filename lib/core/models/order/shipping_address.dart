import 'package:json_annotation/json_annotation.dart';

part 'shipping_address.g.dart';

@JsonSerializable()
class ShippingAddress {
  String address;
  String postal_code;
  String city;
  String country;
  ShippingAddress(
    this.address,
    this.postal_code,
    this.city,
    this.country,
  );
  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
