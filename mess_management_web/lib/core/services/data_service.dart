import 'dart:convert';

import 'package:jiffy/jiffy.dart';
import 'package:mess_management_web/core/models/expense.dart';
import 'package:mess_management_web/core/models/student.dart';
import 'package:mess_management_web/core/models/wastage.dart';
import 'package:mess_management_web/core/models/worker.dart';
import 'package:mess_management_web/core/models/worker_role.dart';
import 'package:mess_management_web/core/services/menu_service.dart';

import '../../service_locator.dart';
import 'api.dart';

class DataService {
  final _api = locator<Api>();

  static final now = DateTime.now();
  static int weekNumber = Jiffy(now).week;
  static int yearNumber = now.year;

  Future<List<Student>> getStudents() async {
    var response = await _api.get('user/student/');
    var list = <Student>[];
    if (response is List) {
      response.forEach((element) {
        list.add(Student.fromJson(element));
      });
    }
    return list;
  }

  Future<List<Worker>> getWorkers() async {
    var response = await _api.get('user/worker/');
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
    map.remove("user");
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
    map.remove("user");
    map["hostel"] = worker.user.bhawan;
    var response = await _api.post(
      'user/worker/add',
      jsonEncode(map),
    );
    if (response != null) {
      return true;
    }
    return false;
  }

  Future<List<Wastage>> getWastageData() async {
    var response = await _api.post(
      'wastage',
      jsonEncode(
        <String, dynamic>{"week_number": weekNumber, "year_number": yearNumber},
      ),
    );

    var list = <Wastage>[];
    if (response is List) {
      response.forEach((res) {
        list.add(Wastage.fromJson(res));
      });
      return list;
    }
    return [];
  }

  Future<Expense> getExpenseData() async {
    var response = await _api.post(
      "expense",
      jsonEncode(
        <String, dynamic>{"week_number": weekNumber, "year_number": yearNumber},
      ),
    );
    if (response != null) {
      return Expense.fromJson(response);
    }
    return null;
  }

  Future<String> addExpense(double amount) async {
    var response = await _api.post(
      'expense/add',
      jsonEncode(
        <String, dynamic>{
          "week_number": weekNumber,
          "year_number": yearNumber,
          "amount": amount,
        },
      ),
    );

    return response.toString();
  }

  Future<String> addWastage(
      DateTime date, double amount, double wasteWeight) async {
    var response = await _api.post(
      'wastage/add',
      jsonEncode(<String, dynamic>{
        "curr_date": MenuService.dateToApiFormat(date),
        "amount": amount,
        "waste_weight": wasteWeight,
      }),
    );

    return response.toString();
  }

  Future<List<WorkerRole>> getWorkerRoles() async {
    var response = await _api.get('user/workerrole');
    if (response is List) {
      var list = <WorkerRole>[];
      response.forEach((element) {
        list.add(WorkerRole.fromJson(element));
      });
      return list;
    }
    return null;
  }

  Future<String> addWorkerRole(WorkerRole role) async {
    var response =
        await _api.post('user/workerrole/add', jsonEncode(role.toJson()));
    return response;
  }

  Future<String> delWorkerRole(WorkerRole role) async {
    var response =
        await _api.post('user/workerrole/del', jsonEncode(role.toJson()));
    return response;
  }

  Future<String> updateWorkerRole(WorkerRole role) async {
    var response =
        await _api.post('user/workerrole/update', jsonEncode(role.toJson()));
    return response;
  }
}
