import 'package:mess_management_web/core/services/data_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';
import 'package:mess_management_web/service_locator.dart';

class AddWastageModel extends BaseModel {
  final service = locator<DataService>();

  DateTime date;
  double amount;
  double weight;

  AddWastageModel(this.date);

  String _responseText;

  String get responseText => _responseText;

  set responseText(String value) {
    _responseText = value;
    notifyListeners();
  }

  Future<String> addWastage() async {
    status = Status.LOADING;
    try {
      var response = await service.addWastage(date, amount, weight);
      status = Status.COMPLETED;
      responseText = response;
      return response;
    } catch (e) {
      errorText = e.toString();
      responseText = e.toString();
      status = Status.ERROR;
    }
    return "";
  }
}
