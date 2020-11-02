import 'package:json_annotation/json_annotation.dart';

part 'worker_role.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WorkerRole {
  String workerRole;
  double salary;
  String shiftStart;
  String shiftEnd;

  WorkerRole(this.workerRole, this.salary, this.shiftStart, this.shiftEnd);

  factory WorkerRole.fromJson(Map<String, dynamic> json) =>
      _$WorkerRoleFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerRoleToJson(this);
}
