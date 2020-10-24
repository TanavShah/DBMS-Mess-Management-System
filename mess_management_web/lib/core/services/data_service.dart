import 'package:mess_management_web/core/models/student.dart';
import 'package:mess_management_web/core/models/worker.dart';

import '../../service_locator.dart';
import 'api.dart';

class DataService {
  final _api = locator<Api>();

  Future<List<Student>> getStudents() async {
    var response = await _api.get('user/student');
    var list = <Student>[];
    if (response is List) {
      response.forEach((element) {
        list.add(Student.fromJson(element));
      });
    }
    return list;
  }

  Future<List<Worker>> getWorkers() async {
    var response = await _api.get('user/worker');
    var list = <Worker>[];
    if (response is List) {
      response.forEach((element) {
        list.add(Worker.fromJson(element));
      });
    }
    return list;
  }
}
