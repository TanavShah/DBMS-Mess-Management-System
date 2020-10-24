import 'package:flutter/material.dart';
import 'package:mess_management_web/core/viewmodels/menu_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/home/menu/mess_menu_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:jiffy/jiffy.dart';

class MessMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MenuModel>(
        builder: (_, model, __) {
          final list = model.currentMenu != null
              ? List.generate(
                  model.currentMenu.menus.length,
                  (i) => MessMenuListWidget(
                        menu: model.currentMenu.menus.elementAt(i),
                      ))
              : [Container()];
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                          child: Text(
                              Jiffy(model.selectedDate).format("dd MMM, yyyy"),
                              style: b90_14_600),
                        ),
                      ],
                    ),
                  ),
                  model.currentMenu != null
                      ? Flexible(
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [...list],
                            ),
                          ),
                        )
                      : MenuNotAvailable(),
                ],
              ),
            ),
          );
        },
      ),
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
