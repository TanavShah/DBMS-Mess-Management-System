import 'package:mess_management_web/core/api/menu_response.dart';
import 'package:mess_management_web/core/services/menu_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';

import '../../service_locator.dart';

class MenuModel extends BaseModel {
  final _menuService = locator<MenuService>();

  MenuModel() {
    _selectedDate = DateTime.now();
    fetchMenu(_selectedDate);
  }

  DateTime _selectedDate;
  MenuResponse _currentMenu;

  MenuResponse get currentMenu => _currentMenu;

  set currentMenu(MenuResponse value) {
    _currentMenu = value;
    notifyListeners();
  }

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  Future<MenuResponse> fetchMenu(DateTime menuDate) async {
    var menu = await _menuService.getMenuResponse(menuDate);
    currentMenu = menu;
    notifyListeners();
    return menu;
  }
}
