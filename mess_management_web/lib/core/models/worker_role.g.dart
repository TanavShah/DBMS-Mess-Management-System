// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerRole _$WorkerRoleFromJson(Map<String, dynamic> json) {
  return WorkerRole(
    json['worker_role'] as String,
    (json['salary'] as num)?.toDouble(),
    json['shift_start'] as String,
    json['shift_end'] as String,
  );
}

Map<String, dynamic> _$WorkerRoleToJson(WorkerRole instance) =>
    <String, dynamic>{
      'worker_role': instance.workerRole,
      'salary': instance.salary,
      'shift_start': instance.shiftStart,
      'shift_end': instance.shiftEnd,
    };
