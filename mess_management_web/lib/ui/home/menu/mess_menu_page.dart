import 'package:flutter/material.dart';
import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/core/viewmodels/menu_model.dart';
import 'package:mess_management_web/service_locator.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:mess_management_web/ui/home/menu/add_menu_column.dart';
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
                              initialDate: model.selectedDate,
                              firstDate: DateTime.utc(2020, 10, 1),
                              lastDate: DateTime(2021, 1, 1),
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
                  model.currentMenu != null &&
                          model.currentMenu.menus.length != 0
                      ? Flexible(
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [...list],
                            ),
                          ),
                        )
                      : Flexible(child: MenuNotAvailable()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MenuNotAvailable extends StatefulWidget {
  @override
  _MenuNotAvailableState createState() => _MenuNotAvailableState();
}

class _MenuNotAvailableState extends State<MenuNotAvailable> {
  bool showAddMenu = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Menu not available'),
          if (locator<AuthService>().isWorker == true)
            AppButton(
              text: "Add Menu",
              onPressed: () {
                setState(() {
                  showAddMenu = true;
                });
              },
            ),
          if (showAddMenu)
            Flexible(
              child: AddMenuColumn(
                menuDate:
                    Provider.of<MenuModel>(context, listen: false).selectedDate,
              ),
            )
        ],
      ),
    );
  }
}
