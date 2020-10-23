import 'package:flutter/material.dart';
import 'package:mess_management_web/ui/home/menu/mess_menu_heading_widget.dart';
import 'package:mess_management_web/ui/home/menu/mess_menu_item.dart';

class MessMenuListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessMenuHeadingWidget(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, i) {
              return MessMenuItem();
            },
          ),
        )
      ],
    );
  }
}
