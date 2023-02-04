import 'package:badges/badges.dart';
import 'package:beautify/core/enum/view_state.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/widgets/cart/card_item_card.dart';
import 'package:beautify/ui/widgets/cart/payment_details_card.dart';
import 'package:beautify/ui/widgets/home/carousel_section_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../../core/models/order/order_item.dart';
import '../../core/viewmodels/cart_model.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart_screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double bagTotal = 0.0;
  _buildCartItems(CartModel value) {
    final List<CartItemCard> cartItemCards = [];
    value.orderItems.forEach((orderItem) {
      cartItemCards.add(
        CartItemCard(
          orderItem: orderItem,
          model: value,
        ),
      );
    });

    return cartItemCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        leading: BackButton(color: Colors.black),
        title: Text(
          "Beautify",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            color: kTextColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(),
                ),
              );
            },
            icon: Badge(
              badgeContent: Text(
                Provider.of<CartModel>(context, listen: true)
                    .orderItems
                    .length
                    .toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              badgeColor: kPrimaryColor,
              child: Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
            color: kTextColor,
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          value.getPaymentDetails;
          return value.state == ViewState.Busy
              ? CarouselSectionShimmer()
              : value.orderItems.length == 0
                  ? Center(child: Text("Your cart is empty"))
                  : Column(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.04),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Column(
                                  children: _buildCartItems(value),
                                ),
                                SizedBox(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kProductBackgroundColor,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: kPrimaryColor,
                                      ),
                                      Text(
                                        "ADD FROM WISHLIST",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Source Sans Pro'),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 5.0,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kProductBackgroundColor,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.card_giftcard,
                                        color: Colors.black45,
                                      ),
                                      Text(
                                        "Add A GIFT BOX FOR \$300",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Source Sans Pro'),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                PaymentDetailsCard(
                                  bag_total: value.bagTotal,
                                  shipping_price: value.shippingPrice,
                                  grand_total: value.grandTotal,
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey.shade300,
                        //     borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(
                        //           8.0,
                        //         ),
                        //         topRight: Radius.circular(
                        //           8.0,
                        //         )),
                        //   ),
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: MediaQuery.of(context).size.width * 0.04,
                        //   ),
                        // ),
                        Container(
                          decoration: BoxDecoration(
                            color: kProductBackgroundColor,
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Grand Total",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "\$511",
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              Text(
                                                "\$500",
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: kPrimaryColor,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: kPrimaryColor,
                                      fixedSize: Size(0, 55.0)),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        "PROCEED",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
