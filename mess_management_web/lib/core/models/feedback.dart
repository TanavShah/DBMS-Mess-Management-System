import 'package:json_annotation/json_annotation.dart';
part 'feedback.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FeedBack {
  String studentId;
  String title;
  String feedbackDescription;

  FeedBack(this.studentId, this.title, this.feedbackDescription);

  factory FeedBack.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
