import 'package:json_annotation/json_annotation.dart';
part 'feedback.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FeedBack {
  String enrollmentNo;
  String title;
  String feedbackDescription;

  FeedBack(this.enrollmentNo, this.title, this.feedbackDescription);

  factory FeedBack.fromJson(Map<String, dynamic> json) =>
      _$FeedBackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedBackToJson(this);
}
