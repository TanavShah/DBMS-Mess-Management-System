import 'package:flutter/material.dart';
import 'package:mess_management_web/styles.dart';

class MessMenuHeadingWidget extends StatelessWidget {
  final int id;

  const MessMenuHeadingWidget({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mapping[id][0],
      child: Text(
        mapping[id][1],
        style: b90_14_600,
      ),
    );
  }

  static const mapping = {
    1: [Colors.red, "Breakfast"],
    2: [Colors.yellow, "Lunch"],
    3: [Colors.blue, "Dinner"],
  };
}
