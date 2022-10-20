import 'package:beautify/constants.dart';
import 'package:beautify/core/enum/view_state.dart';
import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/core/services/api/product_api.dart';
import 'package:beautify/core/viewmodels/base_model.dart';
import 'package:beautify/core/viewmodels/cart_model.dart';
import 'package:beautify/core/viewmodels/home_model.dart';
import 'package:beautify/ui/views/cart_screen.dart';
import 'package:beautify/ui/views/category_screen.dart';
import 'package:beautify/ui/widgets/carousel_builder.dart';
import 'package:beautify/ui/widgets/home/basket_section.dart';
import 'package:beautify/ui/widgets/home/category_section.dart';
import 'package:beautify/ui/widgets/home/guide_section.dart';
import 'package:beautify/ui/widgets/home/offer_carousel.dart';
import 'package:beautify/ui/widgets/home/offer_section.dart';
import 'package:beautify/ui/widgets/home/trending_sections.dart';
import 'package:beautify/ui/widgets/product/category_card.dart';
import 'package:beautify/ui/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../shared/app_colors.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  late HomeModel _homeModel;
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
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
      body: Consumer<HomeModel>(
        builder: (context, value, child) {
          return value.products.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : value.error
                  ? Center(
                      child: Text(value.errorMessage),
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          leading: Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                color: kTextColor,
                                icon: Icon(
                                  Icons.menu,
                                ),
                                tooltip: MaterialLocalizations.of(context)
                                    .openAppDrawerTooltip,
                              );
                            },
                          ),
                          backgroundColor: kBackgroundColor,
                          floating: true,
                          pinned: true,
                          snap: false,
                          title: Text(
                            "Beautify",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
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
                          ],
                          bottom: AppBar(
                            elevation: 0.0,
                            backgroundColor: kBackgroundColor,
                            automaticallyImplyLeading: false,
                            title: Container(
                              width: double.infinity,
                              height: 40,
                              color: Colors.white,
                              child: const Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 218, 216, 216),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'Search on Beautify...',
                                    hintStyle: TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      fontSize: 12.0,
                                    ),
                                    prefixIcon: Icon(Icons.search),
                                    suffixIcon: Icon(
                                      Icons.camera_alt,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          sliver: SliverToBoxAdapter(
                            child: Row(
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                  ),
                                  onPressed: () async {
                                    await value.getProducts;
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "All categories",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CategorySection(
                          categories: value.categories,
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              "New",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                CaruoselBuilder(
                                  imgUrls: kItemsUrl,
                                  autoplay: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              "Trending",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        TrendingSection(products: value.products),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              "Offers",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                OfferCarousel(
                                  imageUrls: kItemsUrl,
                                  autoplay: true,
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              "Guides",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        GuideSection(guides: kItemsUrl),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 5.0,
                          ),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              "Baskets",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        BasketSection(items: kItemsUrl)
                      ],
                    );
        },
      ),
    );
  }
}
