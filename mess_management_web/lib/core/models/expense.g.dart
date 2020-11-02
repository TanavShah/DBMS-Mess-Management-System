// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return Expense(
    json['week_number'] as int,
    json['year_number'] as int,
    (json['amount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'week_number': instance.weekNumber,
      'year_number': instance.yearNumber,
      'amount': instance.amount,
    };
