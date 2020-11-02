import 'package:mess_management_web/core/models/expense.dart';
import 'package:mess_management_web/core/models/wastage.dart';
import 'package:mess_management_web/core/services/data_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';

import '../../service_locator.dart';

class MessDataModel extends BaseModel {
  final service = locator<DataService>();

  List<Wastage> _wastageData;
  Expense _expenseData;

  List<Wastage> get wastageData => _wastageData;

  MessDataModel() {
    getWastage();
    getExpenses();
  }

  set wastageData(List<Wastage> value) {
    _wastageData = value;
    notifyListeners();
  }

  Future<void> getWastage() async {
    status = Status.LOADING;
    var response = await service.getWastageData();
    status = Status.COMPLETED;
    wastageData = response;
  }

  Future<void> getExpenses() async {
    status = Status.LOADING;
    var response = await service.getExpenseData();
    status = Status.COMPLETED;
    expenseData = response;
  }

  Expense get expenseData => _expenseData;

  set expenseData(Expense value) {
    _expenseData = value;
    notifyListeners();
  }

  Future<String> addExpense(double amount) async {
    var response;
    try {
      response = await service.addExpense(amount);
    } catch (e) {
      response = e.toString();
    }
    return response;
  }
}
