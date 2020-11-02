import 'package:flutter/material.dart';
import 'package:mess_management_web/core/viewmodels/add_wastage_mode.dart';
import 'package:mess_management_web/core/viewmodels/menu_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:provider/provider.dart';

class AddWastageColumn extends StatelessWidget {
  final DateTime menuDate;

  const AddWastageColumn({Key key, this.menuDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ChangeNotifierProvider(
        create: (_) => AddWastageModel(menuDate),
        child: Consumer<AddWastageModel>(
          builder: (_, model, ___) => Container(
            padding: EdgeInsets.all(32),
            constraints: BoxConstraints(maxWidth: 500),
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: cardDecorationDeepShadow,
            child: (model.responseText != null)
                ? Text(model.responseText)
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AddWastageField(
                        title: "Wastage (in kg)",
                        onChanged: (value) {
                          model.weight = double.parse(value);
                        },
                      ),
                      AddWastageField(
                        title: "Amount",
                        onChanged: (value) {
                          model.amount = double.parse(value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      AppButton(
                        text: 'ADD',
                        onPressed: () async {
                          await model.addWastage();
                          Provider.of<MenuModel>(context, listen: false)
                              .fetchMenu(menuDate);
                        },
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class AddWastageField extends StatelessWidget {
  final String title;
  final onChanged;
  const AddWastageField({Key key, this.title, this.onChanged})
      : super(key: key);
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
                hintText: title,
                hintStyle: b60_14,
                contentPadding: EdgeInsets.symmetric(vertical: 0)),
          ),
        ),
      ],
    );
  }
}
