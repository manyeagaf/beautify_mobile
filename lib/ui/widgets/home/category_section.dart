import 'package:beautify/core/models/product/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/app_colors.dart';
import '../../views/category_screen.dart';
import '../product/category_card.dart';
import '../product/product_card.dart';

class CategorySection extends StatefulWidget {
  final List<Category> categories;
  CategorySection({required this.categories});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 1 / 1.3,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CategoryCard(
              category: widget.categories[index],
            );
          },
          childCount: widget.categories.length,
        ),
      ),
    );
  }
}
