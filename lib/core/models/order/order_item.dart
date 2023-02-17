import 'package:json_annotation/json_annotation.dart';
part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  int? id;
  final int product;
  final String name;
  final int quantity;
  final String price;
  final String image;
  int? order;
  OrderItem({
    this.id,
    this.order,
    required this.product,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });
  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'name': name,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
