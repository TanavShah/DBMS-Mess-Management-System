import 'package:flutter/material.dart';
import 'package:mess_management_web/styles.dart';

class MessMenuHeadingWidget extends StatelessWidget {
  final int id;

  const MessMenuHeadingWidget({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      // color: mapping[id][0],
      child: Text(
        mapping[id][1],
        style: b90_20_600,
      ),
    );
  }

  static const mapping = {
    1: [Colors.red, "Breakfast"],
    2: [Colors.yellow, "Lunch"],
    3: [Colors.blue, "Dinner"],
  };
}
