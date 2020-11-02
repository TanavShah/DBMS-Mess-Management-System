import 'package:flutter/material.dart';
import 'package:mess_management_web/core/viewmodels/add_menu_model.dart';
import 'package:mess_management_web/core/viewmodels/menu_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/app_button.dart';
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
          padding: EdgeInsets.all(32),
          constraints: BoxConstraints(maxWidth: 500),
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: cardDecorationDeepShadow,
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
              SizedBox(
                height: 16,
              ),
              AppButton(
                text: model.loading ? 'UPLOADING' : 'ADD',
                onPressed: model.loading
                    ? null
                    : () async {
                        await model.addMenu();
                        Provider.of<MenuModel>(context, listen: false)
                            .fetchMenu(menuDate);
                      },
              ),
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
        Container(
          width: 96,
          child: Text(title, style: b90_14_600),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: "Items",
                hintStyle: b60_14,
                contentPadding: EdgeInsets.symmetric(vertical: 0)),
          ),
        ),
      ],
    );
  }
}
