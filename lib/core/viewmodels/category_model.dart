import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/core/services/api/product_api.dart';
import 'package:beautify/core/viewmodels/base_model.dart';
import 'package:beautify/core/enum/view_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModel extends ChangeNotifier {
  final productApi = ProductApi();
  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future getCategoryProducts(String slug) async {
    _isLoading = true;
    _products = await productApi.getCategoryProducts(slug);
    _isLoading = false;
    notifyListeners();
  }
}
