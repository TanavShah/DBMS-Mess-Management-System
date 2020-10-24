import 'dart:convert';

import 'package:mess_management_web/core/api/login_response.dart';
import 'package:mess_management_web/core/models/student.dart';
import 'package:mess_management_web/core/models/user.dart';
import 'package:mess_management_web/core/models/user_type.dart';
import 'package:mess_management_web/core/models/worker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service_locator.dart';
import 'api.dart';

class AuthService {
  Api _api = locator<Api>();
////
  UserType _userType;
  Student _student;
  Worker _worker;
  User _user;

//   dummy
//  UserType _userType = UserType.worker;
//  Student _student = Student.dummy();
//  Worker _worker = Worker.dummy();
//  User _user = User.dummy();

  UserType get userType => _userType;
  User get user => _user;
  Student get student => _student;
  Worker get worker => _worker;
  bool get isWorker => userType == UserType.worker;
  bool get isStudent => userType == UserType.student;

  Future<bool> login(String enrollmentId, String password) async {
    var response = await _api.get('user/login?enrollment_no=$enrollmentId');
    final data = LoginResponse.fromJson(response);
    if (data.exists == true) {
      setLocalFields(data);
      saveLoginInfo(data);
      return true;
    }
    return false;
  }

  void setLocalFields(LoginResponse data) {
    _userType = data.type;
    _worker = data.worker;
    _student = data.student;
    _user = isWorker ? _worker.user : _student.user;
  }

  Future<bool> checkUserLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("login");
    if (data != null) {
      setLocalFields(
        LoginResponse.fromJson(jsonDecode(data)),
      );
      return true;
    }
    return false;
  }

  void saveLoginInfo(LoginResponse data) async {
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setString(
          "login",
          jsonEncode(data.toJson()),
        );
      },
    );
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
