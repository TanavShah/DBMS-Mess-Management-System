import 'package:flutter/material.dart';
import 'package:mess_management_web/colors.dart';
import 'package:mess_management_web/styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final onPressed;

  const AppButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: appOrange,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: white_14_600,
      ),
    );
  }
}
