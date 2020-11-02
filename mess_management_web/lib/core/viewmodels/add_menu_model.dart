import 'package:mess_management_web/core/services/menu_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';
import 'package:mess_management_web/service_locator.dart';

class AddMenuModel extends BaseModel {
  final service = locator<MenuService>();

  String breakfast = "";
  String lunch = "";
  String dinner = "";
  DateTime dateTime;

  AddMenuModel(this.dateTime);

  Future<void> addMenu() async {
    status = Status.LOADING;
    if (breakfast.isNotEmpty) {
      await service.addMenu(dateTime, "Breakfast", breakfast.split(","));
    }
    if (lunch.isNotEmpty) {
      await service.addMenu(dateTime, "Lunch", lunch.split(","));
    }
    if (dinner.isNotEmpty) {
      await service.addMenu(dateTime, "Dinner", dinner.split(","));
    }
    status = Status.COMPLETED;
  }
}
