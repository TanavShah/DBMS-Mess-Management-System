import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'student.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Student {
  User user;
  int yearNo;
  String branch;
  String email;

  Student(this.user, this.yearNo, this.branch, this.email);

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  factory Student.dummy() =>
      Student(User.dummy(), 2018, "CSE", "amishgarg123@gmail.com");
}
