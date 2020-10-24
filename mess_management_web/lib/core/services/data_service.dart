import '../../service_locator.dart';
import 'api.dart';

class DataService {
  final _api = locator<Api>();

  Future<bool> getStudents() async {
    var response = await _api.get('user/student/');
    
  }
}
