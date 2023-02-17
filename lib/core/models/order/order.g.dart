// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      (json['order_items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int,
      User.fromJson(json['user'] as Map<String, dynamic>),
      ShippingAddress.fromJson(
          json['shipping_address'] as Map<String, dynamic>),
      json['is_paid'] as bool,
      json['paid_at'] as String?,
      json['is_delivered'] as bool,
      json['delivered_at'] as String?,
      json['total_price'] as String,
      json['shipping_price'] as String?,
      json['payment_method'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'shipping_address': instance.shipping_address,
      'is_paid': instance.is_paid,
      'paid_at': instance.paid_at,
      'is_delivered': instance.is_delivered,
      'delivered_at': instance.delivered_at,
      'total_price': instance.total_price,
      'shipping_price': instance.shipping_price,
      'payment_method': instance.payment_method,
      'order_items': instance.order_items,
    };
