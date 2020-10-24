// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['year_no'] as int,
    json['branch'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'year_no': instance.yearNo,
      'branch': instance.branch,
      'email': instance.email,
    };
