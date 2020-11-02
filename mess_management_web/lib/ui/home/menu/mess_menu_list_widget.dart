import 'package:flutter/material.dart';
import 'package:mess_management_web/core/models/menu.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/home/menu/mess_menu_heading_widget.dart';
import 'package:mess_management_web/ui/home/menu/mess_menu_item.dart';

class MessMenuListWidget extends StatelessWidget {
  final Menu menu;

  const MessMenuListWidget({Key key, this.menu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final list = List.generate(
        menu.items.length, (i) => MessMenuItem(text: menu.items.elementAt(i)));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width / 4,
        padding: EdgeInsets.all(16),
        decoration: cardDecorationDeepShadow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MessMenuHeadingWidget(id: menu.titleId),
            ...list,
          ],
        ),
      ),
    );
  }
}
