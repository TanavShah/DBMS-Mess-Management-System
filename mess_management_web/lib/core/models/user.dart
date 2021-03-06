import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class User {
  String enrollmentNo;
  String fullName;
  String phoneNo;
  String dateOfBirth;
  String bhawan;

  User(this.enrollmentNo, this.fullName, this.phoneNo, this.dateOfBirth,
      this.bhawan);
  User.empty();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.dummy() => User(
      "18114069", "Binay Jain", "9098989098", "69-69-2000", "Sarojini Bhwan");
}
