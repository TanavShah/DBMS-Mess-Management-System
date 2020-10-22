import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Menu {
  DateTime menuDate;
  String titleName;
  List<String> items;

  Menu(this.menuDate, this.titleName, this.items);

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
