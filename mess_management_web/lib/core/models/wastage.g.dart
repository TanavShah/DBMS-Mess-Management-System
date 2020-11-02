// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wastage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wastage _$WastageFromJson(Map<String, dynamic> json) {
  return Wastage(
    json['curr_date'] == null
        ? null
        : DateTime.parse(json['curr_date'] as String),
    (json['amount'] as num)?.toDouble(),
    (json['waste_weight'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WastageToJson(Wastage instance) => <String, dynamic>{
      'curr_date': instance.currDate?.toIso8601String(),
      'amount': instance.amount,
      'waste_weight': instance.wasteWeight,
    };
