import 'package:beautify/constants.dart';
import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/core/viewmodels/category_model.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/views/cart_screen.dart';
import 'package:beautify/ui/widgets/carousel_builder.dart';
import 'package:beautify/ui/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../core/models/product/product.dart';
import '../../core/viewmodels/home_model.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  CategoryScreen({required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product> products = [];
  late CategoryModel _categoryModel;
  @override
  void initState() {
    // TODO: implement initState
    _categoryModel = Provider.of<CategoryModel>(context, listen: false);

    _categoryModel.getCategoryProducts(widget.category.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Consumer<CategoryModel>(
          builder: (context, value, child) {
            return value.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        leading: Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: kTextColor,
                              icon: Icon(
                                Icons.arrow_back,
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
                              fontWeight: FontWeight.w600),
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
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, CartScreen.id);
                            },
                            icon: Icon(
                              Icons.shopping_bag_outlined,
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
                                  fillColor: Color.fromARGB(255, 218, 216, 216),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'Search on Beautify...',
                                  hintStyle: TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                    fontSize: 12.0,
                                  ),
                                  // prefixIcon: Icon(Icons.search),
                                  // suffixIcon: Icon(
                                  //   Icons.camera_alt,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        sliver: SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 15.0,
                            ),
                            decoration: BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Filter",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Icon(
                                      Icons.filter_list,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.sort_sharp,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Sort by",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: CaruoselBuilder(
                              imgUrls: kItemsUrl, autoplay: true),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10.0),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 0.0,
                            childAspectRatio: 1 / 1.6,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ProductCard(
                                product: value.products[index],
                              );
                            },
                            childCount: value.products.length,
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ));
  }
}
