import 'package:json_annotation/json_annotation.dart';

part 'wastage.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Wastage {
  DateTime currDate;
  double amount;
  double wasteWeight;

  Wastage(this.currDate, this.amount, this.wasteWeight);

  factory Wastage.fromJson(Map<String, dynamic> json) =>
      _$WastageFromJson(json);

  Map<String, dynamic> toJson() => _$WastageToJson(this);
}
