import 'package:beautify/core/models/order/order_item.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:beautify/core/models/order/shipping_address.dart';

import '../user.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  int id;
  User user;
  ShippingAddress shipping_address;
  bool is_paid;
  String? paid_at;
  bool is_delivered;
  String? delivered_at;
  String total_price;
  String? shipping_price;
  String? payment_method;
  List<OrderItem> order_items;
  Order(
    this.order_items,
    this.id,
    this.user,
    this.shipping_address,
    this.is_paid,
    this.paid_at,
    this.is_delivered,
    this.delivered_at,
    this.total_price,
    this.shipping_price,
    this.payment_method,
  );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
