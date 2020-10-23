import 'package:flutter/material.dart';
import 'package:mess_management_web/core/viewmodels/menu_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/home/menu/mess_menu_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:jiffy/jiffy.dart';

class MessMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuModel>(
      builder: (_, model, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(Jiffy(model.selectedDate).format("dd MMM, yyyy"),
                    style: b90_14_600),
                FlatButton(
                  onPressed: () async {
                    final selected = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.utc(2020, 10, 1),
                      lastDate: DateTime.now(),
                    );
                    model.selectedDate = selected;
                  },
                  child: Text('SELECT DATE'),
                ),
              ],
            ),
            model.currentMenu != null
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: model.currentMenu.menus.length,
                      itemBuilder: (_, i) {
                        return MessMenuListWidget(
                          menu: model.currentMenu.menus.elementAt(i),
                        );
                        return Text(' HELLO $i');
                      },
                    ),
                  )
                : MenuNotAvailable(),
          ],
        );
      },
    );
  }
}

class MenuNotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Menu not available'),
    );
  }
}
