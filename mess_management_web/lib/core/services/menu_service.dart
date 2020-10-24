import 'dart:convert';

import 'package:mess_management_web/core/api/menu_response.dart';
import 'package:mess_management_web/core/models/menu.dart';

import '../../service_locator.dart';
import 'api.dart';

class MenuService {
  final _api = locator<Api>();

//  Map<DateTime, MenuResponse> _menuDB;

  Future<MenuResponse> getMenuResponse(DateTime menuDate) async {
    var response = await _api.post('menu',
        jsonEncode({"menu_date": menuDate.toIso8601String().substring(0, 23)}));

    if (response != null) {
      var list = <Menu>[];
      if (response is List) {
        response.forEach((element) {
          print("ELE $element");
          list.add(Menu.fromJson(element));
        });
      }
      final res = MenuResponse(list);
      print('res ${res.toJson()}');
//      _menuDB[menuDate] = res;
      return res;
    }
    return null;
  }
}
