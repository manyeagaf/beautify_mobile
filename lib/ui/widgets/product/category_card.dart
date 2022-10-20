import 'package:beautify/core/models/product/category.dart';
import 'package:beautify/ui/shared/app_colors.dart';
import 'package:beautify/ui/views/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  CategoryCard({
    required this.category,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CategoryScreen(
                      category: widget.category,
                    )));
      },
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              // padding: EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.width * 0.16,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 10.0,
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.13,
                      width: MediaQuery.of(context).size.width * 0.13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.1),
                          border: Border.all(color: kPrimaryColor, width: 1)),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Image(
                      width: 50.0,
                      height: 50.0,
                      image: NetworkImage(
                          'http://10.0.2.2:8000' + widget.category.image),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            widget.category.name,
          ),
        ],
      ),
    );
  }
}
