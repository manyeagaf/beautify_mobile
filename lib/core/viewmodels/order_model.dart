import 'package:beautify/core/models/order/order_item.dart';
import 'package:beautify/core/services/api/order_api.dart';
import 'package:flutter/material.dart';

import '../enum/view_state.dart';
import '../models/order/order.dart';

class OrderModel extends ChangeNotifier {
  final orderApi = OrderApi();
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  bool _error = false;
  bool get error => _error;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  Order? _newOrder;
  Order? get newOrder => _newOrder;

  Future get getOrders async {
    _state = ViewState.Busy;
    try {
      _orders = await orderApi.getOrders();
    } catch (e) {
      _error = true;
      _errorMessage = e.toString();
      print(e.toString());
    }
    _state = ViewState.Idle;
    notifyListeners();
  }

  Future placeOrder(Map<String, dynamic> data) async {
    _newOrder = await orderApi.createOrder(data);
    notifyListeners();
  }
}
