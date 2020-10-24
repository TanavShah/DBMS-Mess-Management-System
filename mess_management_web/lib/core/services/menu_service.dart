import 'dart:convert';

import 'package:mess_management_web/core/api/menu_response.dart';

import '../../service_locator.dart';
import 'api.dart';

class MenuService {
  final _api = locator<Api>();

  Map<DateTime, MenuResponse> _menuDB;

  Future<MenuResponse> getMenuResponse(DateTime menuDate) async {
    var response = await _api.post('menu', jsonEncode({"menu_date": menuDate}));
//    return MenuResponse.dummy();
    if (response != null) {
      var res = MenuResponse.fromJson(response);
      _menuDB[menuDate] = res;
      return res;
    }
    return null;
  }
}
