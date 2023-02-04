import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class CarouselSectionShimmer extends StatelessWidget {
  const CarouselSectionShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white,
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 10.0,
                width: 10.0,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
              SizedBox(
                width: 7.0,
              ),
              Container(
                height: 10.0,
                width: 10.0,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
              SizedBox(
                width: 7.0,
              ),
              Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle)),
            ])
          ],
        ));
  }
}
