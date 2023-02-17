import 'package:beautify/core/enum/paymrnt_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../shared/app_colors.dart';

class PaymentMethodCheckbox extends StatelessWidget {
  final PaymentMethod value;
  final PaymentMethod group;
  final String title;
  final String img_url;
  final Function(PaymentMethod?) on_change;
  const PaymentMethodCheckbox(
      {required this.value,
      required this.group,
      required this.title,
      required this.img_url,
      required this.on_change,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio(
        activeColor: kPrimaryColor,
        value: value,
        groupValue: group,
        onChanged: on_change,
      ),
      title: Text(title),
      trailing: Image(image: AssetImage(img_url)),
    );
  }
}
