import 'package:json_annotation/json_annotation.dart';

part 'expense.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Expense {
  int weekNumber;
  int yearNumber;
  double amount;

  Expense(this.weekNumber, this.yearNumber, this.amount);

  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
