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
    json['title_name'] as String,
    (json['items'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'menu_date': instance.menuDate?.toIso8601String(),
      'title_name': instance.titleName,
      'items': instance.items,
    };
