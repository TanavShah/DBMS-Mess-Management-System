import 'package:json_annotation/json_annotation.dart';
import 'package:mess_management_web/core/models/feedback.dart';
part 'feedback_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FeedbackList {
  List<FeedBack> items;

  FeedbackList(this.items);

  factory FeedbackList.fromJson(Map<String, dynamic> json) =>
      _$FeedbackListFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackListToJson(this);
}
