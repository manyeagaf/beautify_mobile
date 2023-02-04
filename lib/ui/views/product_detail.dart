import 'package:badges/badges.dart';
import 'package:beautify/constants.dart';
import 'package:beautify/core/models/order/order_item.dart';
import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/core/viewmodels/cart_model.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/widgets/carousel_builder.dart';
import 'package:beautify/ui/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  ProductDetail({required this.product});
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int section_id = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: kBackgroundColor,
        title: Text(
          "Beautify",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            color: kTextColor,
          ),
          Consumer<CartModel>(
            builder: (context, value, child) {
              return IconButton(
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
                    value.orderItems.length.toString(),
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
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 25.0,
                        ),
                        margin: EdgeInsets.only(top: 13.0, bottom: 10.0),
                        width: MediaQuery.of(context).size.width * .95,
                        decoration: BoxDecoration(
                          color: Color(0xfffffffff),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 18.0,
                              ),
                              child: Text(
                                widget.product.name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: CaruoselBuilder(
                                imgUrls: [
                                  'http://127.0.0.1:8000' +
                                      widget.product.image1!,
                                  'http://127.0.0.1:8000' +
                                      widget.product.image2!,
                                  'http://127.0.0.1:8000' +
                                      widget.product.image3!,
                                  'http://127.0.0.1:8000' +
                                      widget.product.image4!
                                ],
                                autoplay: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: Text(
                                "\$ ${widget.product.store_price}",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_outline),
                                    color: Colors.redAccent,
                                    iconSize: 35.0,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Consumer<CartModel>(
                                        builder: (context, value, child) {
                                          return IconButton(
                                            onPressed: () async {
                                              final cartModel = CartModel();
                                              final orderItem = OrderItem(
                                                product: widget.product.id,
                                                name: widget.product.name,
                                                quantity: 1,
                                                price: double.parse(
                                                    widget.product.store_price),
                                                image: widget.product.image1!,
                                              );
                                              await value
                                                  .addOrderItem(orderItem);
                                              await value.getOrderItems;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          CartScreen()));
                                            },
                                            icon: Icon(
                                              Icons.shopping_bag_outlined,
                                              color: kBackgroundColor,
                                            ),
                                          );
                                        },
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star_border_outlined),
                          Icon(Icons.star_border_outlined),
                          Icon(Icons.star_border_outlined),
                          Icon(Icons.star_border_outlined),
                          Text(widget.product.rating.toString()!),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Shades",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 2,
                      ),
                      itemCount: 6,
                      itemBuilder: ((context, index) => GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  backgroundColor: Colors.redAccent,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Green",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            section_id = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: section_id == 1
                                  ? BorderSide(
                                      width: 3.0,
                                      color: kPrimaryColor,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                          child: Text(
                            "Ingridients",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            section_id = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: section_id == 2
                                  ? BorderSide(
                                      width: 3.0,
                                      color: kPrimaryColor,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                          child: Text(
                            "Usage and Tips",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            section_id = 3;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: section_id == 3
                                ? BorderSide(
                                    width: 3.0,
                                    color: kPrimaryColor,
                                  )
                                : BorderSide.none,
                          )),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: section_id == 1
                        ? Text(
                            "Ingredients: Easy is the path to wisdom for those who are not blinded by ego",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black54,
                            ),
                          )
                        : section_id == 2
                            ? Text(
                                widget.product.how_to_use!,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                ),
                              )
                            : Text(
                                widget.product.description,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                ),
                              ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Text(
                            "Rating and Reviews(14)",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 25.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.white,
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: kPrimaryColor,
                      ),
                      subtitle: Text(
                        "This product is beauty from heaven.Brought us love",
                      ),
                      title: Text("Manyea G.")),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // Container(
                //   child: GridView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2,
                //         childAspectRatio: 1 / 1.6,
                //         mainAxisSpacing: 10.0),
                //     itemCount: 4,
                //     itemBuilder: ((context, index) => ProductCard(product: Product(id:'', 'name', slug, description, weight, rating, how_to_use, number_of_reviews, is_on_sale, store_price, sale_price, image1, image2, image3, image4, category, brand),)),
                //   ),
                // ),
                Text(
                  "Shades",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
