// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['enrollment_no'] as String,
    json['full_name'] as String,
    json['phone_no'] as String,
    json['date_of_birth'] as String,
    json['bhawan'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'enrollment_no': instance.enrollmentNo,
      'full_name': instance.fullName,
      'phone_no': instance.phoneNo,
      'date_of_birth': instance.dateOfBirth,
      'bhawan': instance.bhawan,
    };
