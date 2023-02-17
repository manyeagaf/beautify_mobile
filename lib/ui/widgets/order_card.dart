import 'package:beautify/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/models/order/order.dart';

class OrderCard extends StatefulWidget {
  final Order order;
  const OrderCard({required this.order, Key? key}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Image(
                  height: 50.0,
                  width: 50.0,
                  image: NetworkImage(
                    'http://127.0.0.1:8000' + widget.order.order_items[0].image,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
