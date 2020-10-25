import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'worker.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Worker {
  User user;
  double salary;
  String workerRole;
  String shiftStart;
  String shiftEnd;

  Worker(
      this.user, this.salary, this.workerRole, this.shiftStart, this.shiftEnd);
  Worker.empty();

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);

  factory Worker.dummy() => Worker(User.dummy(), 1000, 'jobber', "14", "14");
}
