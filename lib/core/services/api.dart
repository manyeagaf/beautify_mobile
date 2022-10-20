import 'package:beautify/core/models/product/product.dart';
import 'package:dio/dio.dart';

class DioClient {
  final _dio = Dio();
  final _baseUrl = 'http://10.0.2.2:8000/api';
}
