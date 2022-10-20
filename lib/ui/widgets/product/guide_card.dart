import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GuideCard extends StatefulWidget {
  final String image;
  GuideCard({required this.image});

  @override
  State<GuideCard> createState() => _GuideCardState();
}

class _GuideCardState extends State<GuideCard> {
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
          "Beginner",
          style: TextStyle(
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
