import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class SectionTitleShimmer extends StatelessWidget {
  const SectionTitleShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      sliver: SliverToBoxAdapter(
          child: Shimmer.fromColors(
              child: Container(
                color: Colors.white,
                height: 20.0,
                width: MediaQuery.of(context).size.width * .7,
              ),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!)),
    );
  }
}
