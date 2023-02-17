import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/core/services/api/product_api.dart';
import 'package:beautify/core/viewmodels/base_model.dart';
import 'package:beautify/core/enum/view_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product/brand.dart';

class HomeModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  final productApi = ProductApi();
  List<Product> _products = [];
  List<Product> get products => _products;
  List<Category> _categories = [];
  List<Category> get categories => _categories;
  List<Brand> _brands = [];
  List<Brand> get brands => _brands;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _error = false;
  bool get error => _error;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future get getCategories async {
    try {
      _state = ViewState.Busy;
      _categories = await productApi.getCategories();
      _state = ViewState.Idle;
      ;
    } catch (e) {
      _error = true;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future get getProducts async {
    try {
      _state = ViewState.Busy;

      _products = await productApi.getProducts();
      _state = ViewState.Idle;
      ;
    } catch (e) {
      _error = true;
      _errorMessage = e.toString();
      print(_errorMessage);
    }
    notifyListeners();
  }

  Future get getBrands async {
    _state = ViewState.Busy;
    _brands = await productApi.getBrands();
    _state = ViewState.Idle;
    notifyListeners();
  }
}
