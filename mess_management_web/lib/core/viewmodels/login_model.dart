import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';

import '../../service_locator.dart';

class LoginModel extends BaseModel {
  final _auth = locator<AuthService>();

  Future<bool> login(String enrollmentId, String password) async {
    status = Status.LOADING;
//    try {
      bool ok = await _auth.login(enrollmentId, password);
      status = Status.COMPLETED;
      return ok;
//    } catch (e) {
//      status = Status.ERROR;
//      print(e.toString());
//    }
    return false;
  }
}
