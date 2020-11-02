import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mess_management_web/core/models/expense.dart';
import 'package:mess_management_web/core/models/wastage.dart';
import 'package:mess_management_web/core/viewmodels/mess_data_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:provider/provider.dart';

class MessDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MessDataModel(),
      child: Consumer<MessDataModel>(builder: (_, model, __) {
        var row = model.wastageData != null
            ? List.generate(
                model.wastageData.length,
                (index) => WastageData(
                      wastage: model.wastageData.elementAt(index),
                    ))
            : null;
        return Container(
          padding: EdgeInsets.all(48),
          child: model.loading
              ? Center(
                  child: Column(
                    children: [
                      Text('Fetching mess data'),
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (row != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Wastage Data',
                              style: b90_20_600,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: row,
                          ),
                        ],
                      ),
                    if (row == null)
                      Text(
                        'Wastage Data not uploaded',
                        style: b60_14,
                      ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Expense Data',
                              style: b90_20_600,
                            ),
                          ),
                          ExpensesData(
                            expense: model.expenseData,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}

class WastageData extends StatelessWidget {
  final Wastage wastage;
  const WastageData({Key key, this.wastage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: cardDecoration,
        width: 160,
        child: Column(
          children: [
            Text(
              Jiffy(wastage.currDate).format("dd MMM, yy"),
              style: appBlack_16_600,
            ),
            SizedBox(
              height: 4,
            ),
            EntryField(
                text1: "Amount ", text2: "\u20b9 " + wastage.amount.toString()),
            EntryField(
                text1: "Weight", text2: wastage.wasteWeight.toString() + " Kg"),
          ],
        ),
      ),
    );
  }
}

class ExpensesData extends StatefulWidget {
  final Expense expense;
  const ExpensesData({Key key, this.expense}) : super(key: key);

  @override
  _ExpensesDataState createState() => _ExpensesDataState();
}

class _ExpensesDataState extends State<ExpensesData> {
  TextEditingController controller = TextEditingController();
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 240,
      decoration: cardDecorationDeepShadow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.expense?.amount != null)
            Text(
              "\u20b9 ${widget.expense.amount}",
              style: b90_20_600,
            ),
          if (widget.expense?.amount == null)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixText: "\u20b9",
                    prefixStyle: b60_14,
                    hintText: 'Expense',
                    hintStyle: b60_14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    infoText,
                    style: b80_12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton(
                    text: "ADD Expense",
                    onPressed: () async {
                      double amount;
                      try {
                        amount = double.parse(controller.text);
                      } catch (e) {
                        print(e.toString());
                      }
                      if (amount != null) {
                        var k = await Provider.of<MessDataModel>(context,
                                listen: false)
                            .addExpense(amount);
                        if (k == "Created successfully") {
                          Provider.of<MessDataModel>(context, listen: false)
                              .getExpenses();
                        }
                        setState(() {
                          infoText = k;
                        });
                      } else {
                        setState(() {
                          infoText = "Input not valid";
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class EntryField extends StatelessWidget {
  final String text1;
  final String text2;
  const EntryField({Key key, this.text1, this.text2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: b90_14_600,
          ),
          Text(
            text2,
            style: b90_14,
          ),
        ],
      ),
    );
  }
}
