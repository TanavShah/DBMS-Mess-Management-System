import 'package:flutter/material.dart';
import 'package:mess_management_web/core/viewmodels/add_menu_model.dart';
import 'package:mess_management_web/core/viewmodels/menu_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:provider/provider.dart';

class AddMenuColumn extends StatelessWidget {
  final DateTime menuDate;

  const AddMenuColumn({Key key, this.menuDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddMenuModel(menuDate),
      child: Consumer<AddMenuModel>(
        builder: (_, model, ___) => Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddMenuField(
                title: "Breakfast",
                onChanged: (value) {
                  model.breakfast = value;
                },
              ),
              AddMenuField(
                title: "Lunch",
                onChanged: (value) {
                  model.lunch = value;
                },
              ),
              AddMenuField(
                title: "Dinner",
                onChanged: (value) {
                  model.dinner = value;
                },
              ),
              FlatButton(
                child: Text(
                  'ADD',
                  style: b90_12_600,
                ),
                onPressed: () async {
                  await model.addMenu();
                  Provider.of<MenuModel>(context, listen: false)
                      .fetchMenu(menuDate);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddMenuField extends StatelessWidget {
  final String title;
  final onChanged;
  const AddMenuField({Key key, this.title, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: b90_14_600),
        Flexible(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(hintText: "Items"),
          ),
        ),
      ],
    );
  }
}
