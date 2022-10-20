import 'package:beautify/core/models/order/order_item.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/widgets/cart/card_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentDetailsCard extends StatefulWidget {
  final List<OrderItem> orderItems;
  PaymentDetailsCard({required this.orderItems});
  @override
  State<PaymentDetailsCard> createState() => _PaymentDetailsCardState();
}

class _PaymentDetailsCardState extends State<PaymentDetailsCard> {
  double bagTotal = 0.0;
  @override
  Widget build(BuildContext context) {
    bagTotal = 0.0;
    widget.orderItems.forEach((orderItem) {
      bagTotal += orderItem.price * orderItem.quantity;
    });
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kProductBackgroundColor,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              "Payment Details",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Source Sans Pro'),
            ),
          ),
          SizedBox(
            child: Divider(
              thickness: 4.0,
              height: 5.0,
              color: kBackgroundColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bag Total",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "\$${bagTotal}",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub Total",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "\$${bagTotal}",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Charge",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  bagTotal >= 1000.0 ? "Free" : "\$65",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Grand Total",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bagTotal >= 1000.0 || bagTotal == 0.0
                      ? "\$${bagTotal}"
                      : "\$${bagTotal + 65}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 5.0,
            ),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              shape: BoxShape.rectangle,
            ),
            child: Row(
              children: [
                Text(
                  "Have A Coupon Code",
                ),
                Spacer(),
                Text(
                  "VIEW COUPONS",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            child: Divider(
              thickness: 4.0,
              height: 5.0,
              color: kBackgroundColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Earn 500 Reward points on delivery of this order",
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Net Savings'),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "\$40",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
