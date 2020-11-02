import 'package:mess_management_web/core/models/worker_role.dart';
import 'package:mess_management_web/core/services/data_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';

import '../../service_locator.dart';

class WorkerRoleModel extends BaseModel {
  final service = locator<DataService>();

  WorkerRole _role = WorkerRole("", 0, "", "");

  WorkerRole get role => _role;

  set role(WorkerRole value) {
    _role = value;
    notifyListeners();
  }

  List<WorkerRole> _roles;

  List<WorkerRole> get roles => _roles;

  set roles(List<WorkerRole> value) {
    _roles = value;
    notifyListeners();
  }

  WorkerRoleModel() {
    fetchWorkerRoles();
  }

  String _infoText;

  String get infoText => _infoText;

  set infoText(String value) {
    _infoText = value;
    notifyListeners();
  }

  Future<void> fetchWorkerRoles() async {
    status = Status.LOADING;
    var response = await service.getWorkerRoles();
    roles = response;
    status = Status.COMPLETED;
  }

  Future<void> addWorkerRole(WorkerRole role) async {
    var response = await service.addWorkerRole(role);
    _role = WorkerRole("", 0, "", "");
    infoText = response;
    fetchWorkerRoles();
  }

  Future<void> updateWorkerRole(WorkerRole role) async {
    var response = await service.updateWorkerRole(role);
    infoText = response;
    fetchWorkerRoles();
  }

  Future<void> delWorkerRole(WorkerRole role) async {
    var response = await service.delWorkerRole(role);
    infoText = response;
    fetchWorkerRoles();
  }
}
