import 'package:json_annotation/json_annotation.dart';
import 'package:mess_management_web/core/models/menu.dart';

part 'menu_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MenuResponse {
  List<Menu> menus;

  MenuResponse(this.menus);

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);

  factory MenuResponse.dummy() => MenuResponse([
        Menu.dummy(),
        Menu.dummy(),
        Menu.dummy(),
      ]);
}
