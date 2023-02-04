import 'dart:convert';
import 'package:beautify/constants.dart';
import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/core/services/api.dart';
import 'package:dio/dio.dart';

import '../../models/order/order.dart';
import '../../models/product/product.dart';

class ProductApi {
  final _dio = Dio();

  //Get all the products
  Future<List<Product>> getProducts() async {
    try {
      Response response = await _dio.get(baseUrl + 'products/');
      print(response.data['results']);
      var products = response.data['results'] as List;

      return products.map((e) => Product.fromJson(e)).toList();
    } on DioError catch (e) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');

      print(e.message);

      throw e.message.toString();
    }
  }

  //Get a single product using its id
  Future<Product> getProduct(int id) async {
    Product? product;
    try {
      Response response = await _dio.get(baseUrl + 'products/' + id.toString());
      product = Product.fromJson(response.data);
      return product;
    } on DioError catch (e) {
      throw e.message.toString();
    }
  }

  Future<List<Product>> getCategoryProducts(String slug) async {
    try {
      Response response = await _dio.get(baseUrl + 'products/category/' + slug);
      var products = response.data["results"] as List;
      return products.map((e) => Product.fromJson(e)).toList();
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      Response response = await _dio.get(baseUrl + 'products/category/all/');
      var categories = response.data as List;
      return categories.map((e) => Category.fromJson(e)).toList();
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
