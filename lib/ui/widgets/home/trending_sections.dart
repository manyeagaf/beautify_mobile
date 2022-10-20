import 'package:beautify/core/models/product/product.dart';
import 'package:beautify/ui/widgets/home/trending_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../product/product_card.dart';

class TrendingSection extends StatefulWidget {
  final List<Product> products;
  TrendingSection({required this.products});

  @override
  State<TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection> {
  @override
  Widget build(BuildContext context) {
    return
        // SliverPadding(
        //   padding: EdgeInsets.symmetric(horizontal: 8.0),
        //   sliver: SliverList(
        //     delegate: SliverChildListDelegate(
        //       [
        //         TrendingCarousel(
        //           trendingProducts: widget.products,
        //           autoplay: false,
        //         ),
        //       ],
        //     ),
        //   ),
        // );
        SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1 / 1.6,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ProductCard(
              product: widget.products[index],
            );
          },
          childCount: widget.products.length,
        ),
      ),
    );
  }
}
