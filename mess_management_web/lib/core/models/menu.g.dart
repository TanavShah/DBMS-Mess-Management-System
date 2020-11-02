// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    json['menu_date'] == null
        ? null
        : DateTime.parse(json['menu_date'] as String),
    json['title_id'] as int,
    (json['items'] as List)?.map((e) => e as String)?.toList(),
    json['title_name'] as String,
    json['start_time'] as String,
    json['end_time'] as String,
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'menu_date': instance.menuDate?.toIso8601String(),
      'title_id': instance.titleId,
      'items': instance.items,
      'title_name': instance.titleName,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
