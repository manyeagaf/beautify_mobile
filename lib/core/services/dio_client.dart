import 'package:dio/dio.dart';

import '../../ui/widgets/product/product_card.dart';

class DioClient {
  final _dio = Dio();
  final _baseUrl = 'http://10.0.2.2:8000/api';
}
