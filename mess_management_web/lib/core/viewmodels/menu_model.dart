import 'package:mess_management_web/core/api/menu_response.dart';
import 'package:mess_management_web/core/services/menu_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';

import '../../service_locator.dart';

class MenuModel extends BaseModel {
  final _menuService = locator<MenuService>();

  MenuModel() {
    final now = DateTime.now();
    _selectedDate = DateTime.utc(now.year, now.month, now.day);
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
    fetchMenu(_selectedDate);
  }

  Future<MenuResponse> fetchMenu(DateTime menuDate) async {
    var menu = await _menuService.getMenuResponse(menuDate);
    print('menu: $menu');
    currentMenu = menu;
    notifyListeners();
    return menu;
  }
}
