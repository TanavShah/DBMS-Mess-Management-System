import 'package:flutter/material.dart';
import 'package:mess_management_web/styles.dart';

class MessMenuHeadingWidget extends StatelessWidget {
  final Color color;
  final String heading;

  const MessMenuHeadingWidget({Key key, this.color, this.heading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Text(
        heading,
        style: b90_14_600,
      ),
    );
  }
}
