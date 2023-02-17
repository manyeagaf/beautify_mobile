import 'package:beautify/core/enum/view_state.dart';
import 'package:beautify/core/models/order/order_item.dart';
import 'package:flutter/foundation.dart';
import '../services/databases/database_service.dart';

class CartModel extends ChangeNotifier {
  //Declare our database instance
  final DatabaseService _dbService = DatabaseService();
  DatabaseService get dbService => _dbService;
  List<OrderItem> _orderItems = [];
  List<OrderItem> get orderItems => _orderItems;

  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  double _bagTotal = 0.0;
  double get bagTotal => _bagTotal;

  double _shippingPrice = 0.0;
  double get shippingPrice => _shippingPrice;

  double _grandTotal = 0.0;
  double get grandTotal => _grandTotal;

  Future<void> get getOrderItems async {
    _state = ViewState.Busy;
    _orderItems = await _dbService.getOderItems();
    print(_orderItems);
    await getPaymentDetails;
    _state = ViewState.Idle;
    notifyListeners();
  }

  Future<void> addOrderItem(OrderItem orderItem) async {
    _state = ViewState.Busy;
    await _dbService.insertOrderItem(orderItem);
    _state = ViewState.Idle;
    notifyListeners();
  }

  Future<void> updateOrderItem(OrderItem orderItem) async {
    _state = ViewState.Busy;
    await _dbService.updateQuantity(orderItem);
    _state = ViewState.Idle;
    notifyListeners();
  }

  Future<void> deleteOrderItem(int product) async {
    _state = ViewState.Busy;
    await _dbService.deleteOrderItem(product);
    print("Success");
    _state = ViewState.Idle;
    notifyListeners();
  }

  Future<void> clearCart() async {
    _state = ViewState.Busy;
    await _dbService.clearDb();
    _state = ViewState.Idle;
    notifyListeners();
  }

  Future get getPaymentDetails async {
    _bagTotal = 0.0;
    _shippingPrice = 0.0;
    for (int i = 0; i < orderItems.length; i++) {
      _bagTotal += double.parse(orderItems[i].price!) * orderItems[i].quantity;
    }

    if (_bagTotal < 1000) {
      _shippingPrice = 65;
    } else {
      _shippingPrice = 0.0;
    }
    _grandTotal = _shippingPrice + _bagTotal;
  }
}
