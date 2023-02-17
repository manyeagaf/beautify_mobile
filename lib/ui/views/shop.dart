// ignore_for_file: prefer_const_constructors

import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/core/viewmodels/home_model.dart';
import 'package:beautify/ui/views/cart_screen.dart';
import 'package:beautify/ui/widgets/home/shop_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../core/models/product/brand.dart';
import '../../core/models/product/sub_category.dart';
import '../../core/viewmodels/cart_model.dart';
import '../shared/app_colors.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<bool> expanded = [false, false, false];
  late HomeModel _homeModel;

  String selected = 'categories';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeModel>().getCategories;
    context.read<HomeModel>().getBrands;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: kBackgroundColor,
            elevation: 0.0,
            // leading: IconButton(
            //   onPressed: () {
            //     (context);
            //   },
            //   color: Colors.black,
            //   icon: Icon(
            //     Icons.arrow_back,
            //   ),
            // ),
            title: Text(
              "Beuatify",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 25.0,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async {
                  final cartModel = CartModel();
                  await cartModel.clearCart();
                },
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
                icon: badges.Badge(
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
            ]),
        body: Consumer<HomeModel>(
          builder: (context, value, child) {
            return value.error
                ? Center(
                    child: Text(value.errorMessage),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: kPrimaryColor, width: 4.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  color: selected == 'categories'
                                      ? kPrimaryColor
                                      : Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selected = 'categories';
                                      });
                                    },
                                    child: Text(
                                      "Categories",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: selected == 'categories'
                                            ? Colors.white
                                            : kPrimaryColor,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  color: selected == 'brands'
                                      ? kPrimaryColor
                                      : Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selected = 'brands';
                                      });
                                    },
                                    child: Text(
                                      "Brands",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: selected == 'brands'
                                            ? Colors.white
                                            : kPrimaryColor,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        selected == 'categories'
                            ? ExpansionPanelList.radio(
                                animationDuration: Duration(seconds: 1),
                                children: value.categories
                                    .map((category) => ShopCard(category))
                                    .toList())
                            : ExpansionPanelList.radio(
                                animationDuration: Duration(seconds: 1),
                                children: value.brands
                                    .map((brand) => BrandCard(brand))
                                    .toList()),
                      ],
                    ),
                  );
          },
        ));
  }

  ExpansionPanelRadio ShopCard(Category category) {
    return ExpansionPanelRadio(
        value: category.id,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(
              category.name,
              style: TextStyle(fontSize: 22.0),
            ),
          );
        },
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildSubcategory(category.sub_category),
          ),
        ));
  }

  ExpansionPanelRadio BrandCard(Brand brand) {
    return ExpansionPanelRadio(
        value: brand.name!,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(
              brand.name!,
              style: TextStyle(fontSize: 22.0),
            ),
          );
        },
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(brand.name!),
        ));
  }

  _buildSubcategory(List<SubCategory> subCategories) {
    List<Widget> category_subcategories = [];
    subCategories.forEach((subCategory) {
      category_subcategories.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              subCategory.name,
              style: TextStyle(fontSize: 17.0),
            ),
          ),
        ),
      );
    });
    return category_subcategories;
  }
}
