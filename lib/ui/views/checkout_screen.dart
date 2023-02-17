// ignore_for_file: prefer_const_constructors, empty_statements

import 'package:beautify/core/models/order/shipping_address.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/views/payment_screen.dart';
import 'package:beautify/ui/widgets/checkout/payment_method_checkbox.dart';
import 'package:beautify/ui/views/shipping_screen.dart';
import 'package:beautify/ui/widgets/custom_elevated_button.dart';
import 'package:beautify/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/enum/paymrnt_method.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _page = 0;
  final _shippingAddressFormKey = GlobalKey<FormState>();

  // Shipping address controllers
  final _countryController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Checkout"),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            ShippingScreen(
                form_key: _shippingAddressFormKey,
                page_controller: _pageController,
                address_controller: _addressController,
                country_controller: _countryController,
                city_controller: _cityController,
                postal_address_controller: _postalCodeController),
            PaymentScreen(page_controller: _pageController)
          ],
        ),
      ),
    );
  }
}
