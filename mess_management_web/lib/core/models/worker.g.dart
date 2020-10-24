// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Worker _$WorkerFromJson(Map<String, dynamic> json) {
  return Worker(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    (json['salary'] as num)?.toDouble(),
    json['worker_role'] as String,
    json['shift_start'] as String,
    json['shift_end'] as String,
  );
}

Map<String, dynamic> _$WorkerToJson(Worker instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'salary': instance.salary,
      'worker_role': instance.workerRole,
      'shift_start': instance.shiftStart,
      'shift_end': instance.shiftEnd,
    };
