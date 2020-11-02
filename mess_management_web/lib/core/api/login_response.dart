import 'package:json_annotation/json_annotation.dart';
import 'package:mess_management_web/core/models/student.dart';
import 'package:mess_management_web/core/models/user_type.dart';
import 'package:mess_management_web/core/models/worker.dart';

part 'login_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LoginResponse {
  bool exists;
  UserType type;
  Worker worker;
  Student student;

  LoginResponse(this.exists, this.type, this.worker, this.student);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
