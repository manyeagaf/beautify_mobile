import 'package:beautify/ui/widgets/home/trending_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_textfield.dart';

class ShippingScreen extends StatefulWidget {
  final PageController page_controller;
  final GlobalKey<FormState> form_key;
  final TextEditingController country_controller;
  final TextEditingController address_controller;
  final TextEditingController postal_address_controller;
  final TextEditingController city_controller;
  const ShippingScreen(
      {required this.form_key,
      required this.page_controller,
      required this.address_controller,
      required this.country_controller,
      required this.city_controller,
      required this.postal_address_controller,
      Key? key})
      : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: widget.form_key,
        child: Column(
          children: [
            CustomTextField(
              controller: widget.country_controller,
              title: "Country",
              hintText: "Country",
            ),
            CustomTextField(
                controller: widget.city_controller,
                title: "City",
                hintText: "City"),
            CustomTextField(
                controller: widget.address_controller,
                title: "Street Address",
                hintText: "Street Address"),
            CustomTextField(
                controller: widget.postal_address_controller,
                title: "Postal Code",
                hintText: "Postal Code"),
            SizedBox(
              height: 10.0,
            ),
            Spacer(),
            CustomElevatedButton(
                title: "Confirm and Continue",
                onPressed: () {
                  widget.page_controller.animateToPage(1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.bounceIn);
                })
          ],
        ),
      ),
    );
    ;
  }
}
