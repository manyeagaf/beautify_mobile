import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BasketCard extends StatefulWidget {
  final String image;
  BasketCard({required this.image});

  @override
  State<BasketCard> createState() => _BasketCardState();
}

class _BasketCardState extends State<BasketCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          maxRadius: 30.0,
          backgroundImage: NetworkImage(widget.image),
        ),
        Text(
          "COVID essentials",
          style: TextStyle(
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w800,
          ),
        )
      ],
    );
  }
}
