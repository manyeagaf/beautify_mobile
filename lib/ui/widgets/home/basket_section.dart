import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/ui/widgets/product/basket_card.dart';
import 'package:beautify/ui/widgets/product/guide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/app_colors.dart';
import '../../views/category_screen.dart';
import '../product/category_card.dart';
import '../product/product_card.dart';

class BasketSection extends StatefulWidget {
  final List<String> items;
  BasketSection({required this.items});

  @override
  State<BasketSection> createState() => _BasketSectionState();
}

class _BasketSectionState extends State<BasketSection> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 1 / 1.5,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return BasketCard(image: widget.items[index]);
          },
          childCount: widget.items.length,
        ),
      ),
    );
  }
}
