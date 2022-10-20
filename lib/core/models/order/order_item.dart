class OrderItem {
  final int product;
  final String name;
  final int quantity;
  final double price;
  final String image;
  OrderItem({
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
  @override
  String toString() {
    return 'Expense{product: $product, name: $name, quantity: $quantity,price:$price,image:$image}';
  }
}
