import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class CategorySectionShimmer extends StatelessWidget {
  const CategorySectionShimmer({Key? key}) : super(key: key);

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
            return categoryShimmerCard();
          },
          childCount: 5,
        ),
      ),
    );
  }
}

Shimmer categoryShimmerCard() {
  return Shimmer.fromColors(
    child: Column(children: [
      Container(
        height: 70.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(height: 6.0),
      Container(
        height: 10.0,
        width: 80.0,
        color: Colors.white,
      )
    ]),
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
  );
}
