import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class User {
  String enrollmentNo;
  String fullName;
  String phone_no;
  String dateOfBirth;
  String bhawan;

  User(this.enrollmentNo, this.fullName, this.phone_no, this.dateOfBirth,
      this.bhawan);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.dummy() => User(
      "18114069", "Binay Jain", "9098989098", "69-69-2000", "Sarojini Bhwan");
}
