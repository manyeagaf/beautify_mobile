import 'package:beautify/core/models/order/order.dart';
import 'package:dio/dio.dart';

import '../../../constants.dart';

class OrderApi {
  final _dio = Dio();
  // Future<List<Order>> getOrders() async {
  // try{
  //   Response response = await _dio.get(baseUrl + 'products/');
  //   print(response.data['results']);
  //   var products = response.data['results'] as List;

  //   return products.map((e) => Order.fromJson(e)).toList();
  // }
  // }
}
