import 'dart:convert';

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

  Future<bool> addStudent(Student student) async {
    var map = <String, dynamic>{};
    map.addAll(student.toJson());
    map.addAll(student.user.toJson());
    map["hostel"] = student.user.bhawan;
    map["user"] = null;
    var response = await _api.post(
      'user/student/add',
      jsonEncode(map),
    );
    if (response != null) {
      return true;
    }
    return false;
  }

  Future<bool> addWorker(Worker worker) async {
    var map = <String, dynamic>{};
    map.addAll(worker.toJson());
    map.addAll(worker.user.toJson());
    map["user"] = null;
    var response = await _api.post(
      'user/worker/add',
      jsonEncode(map),
    );
    if (response != null) {
      return true;
    }
    return false;
  }
}
