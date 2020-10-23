import 'package:flutter/material.dart';
import 'package:mess_management_web/styles.dart';

class MessMenuItem extends StatelessWidget {
  final String text;

  const MessMenuItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text, style: b60_14),
    );
  }
}
