import 'package:beautify/constants.dart';
import 'package:beautify/core/enum/view_state.dart';
import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/core/services/api/product_api.dart';
import 'package:beautify/core/viewmodels/base_model.dart';
import 'package:beautify/core/viewmodels/cart_model.dart';
import 'package:beautify/core/viewmodels/home_model.dart';
import 'package:beautify/ui/views/cart_screen.dart';
import 'package:beautify/ui/views/category_screen.dart';
import 'package:beautify/ui/views/home.dart';
import 'package:beautify/ui/views/shop.dart';
import 'package:beautify/ui/widgets/carousel_builder.dart';
import 'package:beautify/ui/widgets/home/basket_section.dart';
import 'package:beautify/ui/widgets/home/category_section.dart';
import 'package:beautify/ui/widgets/home/guide_section.dart';
import 'package:beautify/ui/widgets/home/offer_carousel.dart';
import 'package:beautify/ui/widgets/home/offer_section.dart';
import 'package:beautify/ui/widgets/home/section_title_shimmer.dart';
import 'package:beautify/ui/widgets/home/trending_sections.dart';
import 'package:beautify/ui/widgets/product/category_card.dart';
import 'package:beautify/ui/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../shared/app_colors.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';

import '../widgets/home/carousel_section_shimmer.dart';
import '../widgets/home/category_section_shimmer.dart';
import '../widgets/product/product_shimmer.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  late HomeModel _homeModel;
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    Home(),
    Shop(),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 3: Settings',
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    _homeModel = Provider.of<HomeModel>(context, listen: false);
    _homeModel.getProducts;
    _homeModel.getCategories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<CartModel>().getOrderItems;
    context.read<HomeModel>().getProducts;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("STORES"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("ESTORES"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("BEAUTIFY FASHION"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("BEAUTIFY JEWELLERY"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("BEAUTIFY MEN"),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text("BEAUTIFY PRIVE"),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBackgroundColor,
        iconSize: 20.0,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
