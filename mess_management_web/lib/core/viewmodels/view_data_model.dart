import 'package:mess_management_web/core/models/student.dart';
import 'package:mess_management_web/core/models/user.dart';
import 'package:mess_management_web/core/models/worker.dart';
import 'package:mess_management_web/core/services/data_service.dart';

import '../../service_locator.dart';
import 'base_model.dart';

class ViewDataModel extends BaseModel {
  final data = locator<DataService>();

  ViewDataModel() {
    getStudents();
    getWorkers();
  }

  List<Student> _students;
  List<Worker> _workers;

  List<Student> get students => _students;
  List<Worker> get workers => _workers;

  set workers(List<Worker> value) {
    _workers = value;
    notifyListeners();
  }

  set students(List<Student> value) {
    _students = value;
    notifyListeners();
  }

  Future<void> getStudents() async {
    var res = await data.getStudents();
    students = res;
  }

  Future<void> getWorkers() async {
    var res = await data.getWorkers();
    workers = res;
  }

  Future<bool> addStudent() async {
    final student = tempStudent..user = tempUser;
    var res = await data.addStudent(student);
    if (res == true) {
      getStudents();
      tempStudent = Student.empty();
      tempUser = User.empty();
      return true;
    }
    return false;
  }

  Future<bool> addWorker() async {
    final worker = tempWorker..user = tempUser;
    var res = await data.addWorker(worker);
    if (res == true) {
      getWorkers();
      tempWorker = Worker.empty();
      tempUser = User.empty();
      return true;
    }
    return false;
  }

  Student tempStudent = Student.empty();
  Worker tempWorker = Worker.empty();
  User tempUser = User.empty();
}
