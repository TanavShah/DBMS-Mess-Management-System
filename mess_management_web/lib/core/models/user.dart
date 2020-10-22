import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class User {
  String enrollment;
  String fullName;
  String phone;
  String dateOfBirth;
  String bhawan;

  User(this.enrollment, this.fullName, this.phone, this.dateOfBirth,
      this.bhawan);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}