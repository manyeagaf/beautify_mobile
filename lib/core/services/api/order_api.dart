import 'dart:convert';

import 'package:beautify/core/models/order/order.dart';
import 'package:beautify/core/models/order/shipping_address.dart';
import 'package:dio/dio.dart';

import '../../../constants.dart';
import '../../models/order/order_item.dart';

class OrderApi {
  final _dio = Dio();
  Future<List<Order>> getOrders() async {
    try {
      Response response = await _dio.get(baseUrl + 'orders/');
      print(response.data);
      var orders = response.data as List;
      print(orders);

      return orders.map((e) => Order.fromJson(e)).toList();
    } on DioError catch (e) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');

      print(e.message);

      throw e.message.toString();
    }
  }

  Future<Order> createOrder(Map<String, dynamic> data) async {
    try {
      print(data);
      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers["authorization"] =
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc2OTMwODYyLCJpYXQiOjE2NzY0OTg4NjIsImp0aSI6IjkwMmJlZWU2MTNlYTRlOWZhMDgyYTc3NzI0OTEzYzc5IiwidXNlcl9pZCI6MX0.Ky4M_AYte70Bi53JgZ1Qkpxk1ouG3J04UZV3qPQkNrc";
      Response response = await _dio.post(
        baseUrl + 'orders/create/',
        data: data,
      );

      var order = Order.fromJson(response.data);
      return order;
    } on DioError catch (e) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');

      print(e.message);

      throw e.message.toString();
    }
  }
}
