import 'package:beautify/core/models/order/order_item.dart';
import 'package:flutter/foundation.dart';
import '../services/databases/database_service.dart';

class CartModel extends ChangeNotifier {
  //Declare our database instance
  final DatabaseService _dbService = DatabaseService();
  DatabaseService get dbService => _dbService;
  List<OrderItem> _orderItems = [];
  List<OrderItem> get orderItems => _orderItems;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> get getOrderItems async {
    _isLoading = true;
    _orderItems = await _dbService.getOderItems();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addOrderItem(OrderItem orderItem) async {
    _isLoading = true;
    await _dbService.insertOrderItem(orderItem);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateOrderItem(OrderItem orderItem) async {
    _isLoading = true;
    await _dbService.updateQuantity(orderItem);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteOrderItem(int product) async {
    _isLoading = true;
    await _dbService.deleteOrderItem(product);
    print("Success");
    _isLoading = false;
    notifyListeners();
  }

  Future<void> clearCart() async {
    _isLoading = true;
    await _dbService.clearDb();
    _isLoading = false;
    notifyListeners();
  }
}
