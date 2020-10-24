// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return Feedback(
    json['student_id'] as String,
    json['title'] as String,
    json['feedback_description'] as String,
  );
}

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'student_id': instance.studentId,
      'title': instance.title,
      'feedback_description': instance.feedbackDescription,
    };
