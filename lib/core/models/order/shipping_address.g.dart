// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      json['address'] as String?,
      json['postal_code'] as String?,
      json['city'] as String?,
      json['country'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'postal_code': instance.postal_code,
      'city': instance.city,
      'country': instance.country,
    };
