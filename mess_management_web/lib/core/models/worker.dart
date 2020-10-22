import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'worker.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Worker {
  User user;
  double salary;
  String role;
  DateTime shiftStart;
  DateTime shiftEnd;

  Worker(this.user, this.salary, this.role, this.shiftStart, this.shiftEnd);

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}
