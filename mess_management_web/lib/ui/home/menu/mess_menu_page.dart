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

import 'add_wastage_column.dart';

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
                            if (selected != null) model.selectedDate = selected;
                          },
                          child: Container(
                            padding: EdgeInsets.all(32),
                            child: Text(
                                Jiffy(model.selectedDate)
                                    .format("dd MMM, yyyy"),
                                style: b90_20_600.copyWith(
                                    decoration: TextDecoration.underline)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  (model.currentMenu != null &&
                          model.currentMenu.menus.length != 0)
                      ? Flexible(
                          child: Column(
                            children: [
                              Flexible(
                                child: SingleChildScrollView(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [...list],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: MenuNotAvailable(onlyWastage: true),
                              ),
                            ],
                          ),
                        )
                      : Flexible(
                          child: MenuNotAvailable(),
                        ),
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
  final bool onlyWastage;

  const MenuNotAvailable({this.onlyWastage: false});

  @override
  _MenuNotAvailableState createState() => _MenuNotAvailableState();
}

class _MenuNotAvailableState extends State<MenuNotAvailable> {
  bool showAddMenu = false;
  bool showWastageMenu = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (!widget.onlyWastage)
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Image.asset('assets/meal_icon.png', scale: 2),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Menu not uploaded',
                          style: b90_14,
                        ),
                      ],
                    ),
                  ),
                  if (locator<AuthService>().isWorker == true && !showAddMenu)
                    Container(
                      width: 200,
                      child: AppButton(
                        text: "Add Menu",
                        onPressed: () {
                          setState(() {
                            showAddMenu = true;
                            showWastageMenu = false;
                          });
                        },
                      ),
                    ),
                  if (showAddMenu)
                    Flexible(
                      child: AddMenuColumn(
                        menuDate: Provider.of<MenuModel>(context, listen: false)
                            .selectedDate,
                      ),
                    ),
                ],
              ),
            ),
          if (!showWastageMenu && locator<AuthService>().isWorker)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                child: AppButton(
                  text: "Add Wastage",
                  onPressed: () {
                    setState(() {
                      showWastageMenu = true;
                      showAddMenu = false;
                    });
                  },
                ),
              ),
            ),
          if (showWastageMenu)
            Flexible(
              child: AddWastageColumn(
                menuDate:
                    Provider.of<MenuModel>(context, listen: false).selectedDate,
              ),
            ),
        ],
      ),
    );
  }
}
