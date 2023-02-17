// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'] as int?,
      order: json['order'] as int?,
      product: json['product'] as int,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
      'image': instance.image,
      'order': instance.order,
    };
