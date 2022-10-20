import 'package:beautify/core/enum/view_state.dart';
import 'package:flutter/material.dart';
import 'package:beautify/core/services/api/product_api.dart';
import '../models/product/product.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
