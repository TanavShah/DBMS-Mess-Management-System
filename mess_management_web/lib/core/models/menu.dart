import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Menu {
  DateTime menuDate;
  int titleId;
  List<String> items;
  String titleName;
  String startTime;
  String endTime;

  Menu(this.menuDate, this.titleId, this.items, this.titleName, this.startTime,
      this.endTime);

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);

  factory Menu.dummy() => Menu(DateTime.now(), 1,
      ["roti", "tambaku", "paan", "bidi"], "Breakfast", "19:30:00", "21:00:00");
}
