import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mess_management_web/styles.dart';

class MessMenuItem extends StatelessWidget {
  final String text;

  const MessMenuItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/m${Random().nextInt(3) + 1}.png", scale: 19),
              SizedBox(
                width: 8,
              ),
              Text(text, style: b90_14),
            ],
          ),
        ),
        Divider(
          thickness: 0.5,
        ),
      ],
    );
  }
}
