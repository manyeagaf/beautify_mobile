import 'package:beautify/core/models/order/order_item.dart';
import 'package:beautify/core/viewmodels/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/app_colors.dart';

class CartItemCard extends StatefulWidget {
  final OrderItem orderItem;
  final CartModel model;

  CartItemCard({
    required this.model,
    required this.orderItem,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: kProductBackgroundColor,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(10.0),
        //   bottomRight: Radius.circular(10.0),
        // ),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.height * 0.18,
                fit: BoxFit.contain,
                image: NetworkImage(
                    'http://127.0.0.1:8000' + widget.orderItem.image),
              ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.orderItem.name,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '3.5kg',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.redAccent,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('Pink')
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  await widget.model.deleteOrderItem(widget.orderItem.product);
                  await widget.model.getOrderItems;
                },
                color: Colors.black54,
                iconSize: 30.0,
                icon: Icon(
                  Icons.delete_sharp,
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Divider(
              height: 3.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  if (widget.orderItem.quantity > 1) {
                    final orderItem = OrderItem(
                      product: widget.orderItem.product,
                      name: widget.orderItem.name,
                      quantity: widget.orderItem.quantity - 1,
                      price: widget.orderItem.price,
                      image: widget.orderItem.image,
                    );
                    await widget.model.updateOrderItem(orderItem);
                    await widget.model.getOrderItems;
                  } else {
                    widget.model.deleteOrderItem(widget.orderItem.product);
                    await widget.model.getOrderItems;
                  }
                },
                child: Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kPrimaryColor),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                widget.orderItem.quantity.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                width: 5.0,
              ),
              GestureDetector(
                onTap: () async {
                  final orderItem = OrderItem(
                    product: widget.orderItem.product,
                    name: widget.orderItem.name,
                    quantity: widget.orderItem.quantity + 1,
                    price: widget.orderItem.price,
                    image: widget.orderItem.image,
                  );
                  await widget.model.updateOrderItem(orderItem);
                  await widget.model.getOrderItems;
                },
                child: Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: kPrimaryColor)),
                  child: Icon(
                    Icons.add,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "\$${widget.orderItem.price * widget.orderItem.quantity}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
