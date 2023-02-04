import 'package:beautify/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopCategoryCard extends StatefulWidget {
  const ShopCategoryCard({Key? key}) : super(key: key);

  @override
  State<ShopCategoryCard> createState() => _ShopCategoryCardState();
}

class _ShopCategoryCardState extends State<ShopCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedTextColor: kPrimaryColor,
      textColor: kPrimaryColor,
      title: Text(
        "FAQ QUESTION ONE",
        style: TextStyle(
          fontSize: 25.0,
        ),
      ), //header title
      children: [
        Container(
          color: Colors.black12,
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Text("Answers for Question One"),
        )
      ],
    );
  }
}
