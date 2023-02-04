import 'package:badges/badges.dart';
import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/core/viewmodels/home_model.dart';
import 'package:beautify/ui/views/cart_screen.dart';
import 'package:beautify/ui/widgets/home/shop_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeModel>().getCategories;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kBackgroundColor,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {},
              color: Colors.black,
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
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
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 15.0, bottom: 17.0),
                          child: Text(
                            "All categories",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        ExpansionPanelList.radio(
                            animationDuration: Duration(seconds: 1),
                            children: value.categories
                                .map((category) => ShopCard(category))
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
