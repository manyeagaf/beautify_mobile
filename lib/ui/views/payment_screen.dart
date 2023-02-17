import 'package:beautify/ui/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/enum/paymrnt_method.dart';
import '../widgets/checkout/payment_method_checkbox.dart';
import '../widgets/custom_elevated_button.dart';

class PaymentScreen extends StatefulWidget {
  final PageController page_controller;
  const PaymentScreen({required this.page_controller, Key? key})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _pageController = PageController(initialPage: 0);
  final _formKey = GlobalKey<FormState>;
  // Payment controllers
  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvcController = TextEditingController();
  final _momoNumberController = TextEditingController();

  PaymentMethod _paymentMehod = PaymentMethod.none;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PageView(
        children: [
          selectPaymentMethod(),
        ],
      ),
    );
  }

  Widget selectPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose a payment method",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
        ),
        PaymentMethodCheckbox(
          value: PaymentMethod.creditCard,
          group: _paymentMehod,
          title: "Credit Card",
          img_url: 'assets/images/facebook_logo.png',
          on_change: (PaymentMethod? value) {
            setState(
              () {
                _paymentMehod = value!;
              },
            );
          },
        ),
        if (_paymentMehod == PaymentMethod.creditCard)
          Expanded(child: creditCardPayment()),
        PaymentMethodCheckbox(
            value: PaymentMethod.MoMo,
            group: _paymentMehod,
            title: "MoMo",
            img_url: 'assets/images/facebook_logo.png',
            on_change: (PaymentMethod? value) {
              setState(() {
                _paymentMehod = value!;
              });
            }),
        if (_paymentMehod == PaymentMethod.MoMo) momoPayment(),
        CustomElevatedButton(
            title: "Confirm and Continue",
            onPressed: () {
              widget.page_controller.animateToPage(1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.bounceIn);
            }),
      ],
    );
  }

  Widget creditCardPayment() {
    return Form(
        child: Column(
      children: [
        CustomTextField(
          controller: _cardNameController,
          title: "Card Name",
          hintText: "Name on card",
        ),
        CustomTextField(
          controller: _cardNumberController,
          title: "Card Number",
          hintText: "Credit card number",
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: CustomTextField(
                controller: _expiryDateController,
                title: "Expiry Date",
                hintText: "DD/YY",
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Flexible(
              flex: 1,
              child: CustomTextField(
                controller: _cvcController,
                title: "Security Code",
                hintText: "CVC",
              ),
            ),
          ],
        )
      ],
    ));
  }

  Widget momoPayment() {
    return CustomTextField(
        controller: _momoNumberController,
        title: "Mobile Money Number",
        hintText: "Mobile money number");
  }
}
