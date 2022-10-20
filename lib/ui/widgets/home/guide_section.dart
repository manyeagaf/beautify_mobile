import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/ui/widgets/product/guide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/app_colors.dart';
import '../../views/category_screen.dart';
import '../product/category_card.dart';
import '../product/product_card.dart';

class GuideSection extends StatefulWidget {
  final List<String> guides;
  GuideSection({required this.guides});

  @override
  State<GuideSection> createState() => _GuideSectionState();
}

class _GuideSectionState extends State<GuideSection> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 1 / 1.1,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GuideCard(image: widget.guides[index]);
          },
          childCount: widget.guides.length,
        ),
      ),
    );
  }
}
