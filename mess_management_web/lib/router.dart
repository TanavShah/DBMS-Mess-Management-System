import 'package:flutter/material.dart';
import 'package:mess_management_web/core/models/user_type.dart';
import 'package:mess_management_web/ui/home/home_page.dart';
import 'package:mess_management_web/ui/login/login_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
