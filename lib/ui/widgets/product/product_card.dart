// ignore_for_file: prefer_const_constructors

import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/views/product_detail.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  ProductCard({required this.product});
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Color(0xfffffffff),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_outline),
                color: Colors.redAccent,
              ),
              Row(
                children: [
                  Text(widget.product.rating.toString()!),
                  Icon(Icons.star_border_outlined)
                ],
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        'http://127.0.0.1:8000' + widget.product.image1!),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              widget.product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.redAccent,
            ),
            SizedBox(
              width: 5.0,
            ),
            CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.blueAccent,
            ),
            SizedBox(
              width: 5.0,
            ),
            Container(
              height: 35.0,
              width: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: kPrimaryColor,
                ),
              ),
              child: Center(
                child: Text("${widget.product.weight}ml"),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Center(
                  child: Text(
                    "\$${widget.product.store_price}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetail(
                            product: widget.product,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: kBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
