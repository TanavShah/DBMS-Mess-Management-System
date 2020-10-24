// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedBack _$FeedbackFromJson(Map<String, dynamic> json) {
  return FeedBack(
    json['student_id'] as String,
    json['title'] as String,
    json['feedback_description'] as String,
  );
}

Map<String, dynamic> _$FeedbackToJson(FeedBack instance) => <String, dynamic>{
      'student_id': instance.enrollmentId,
      'title': instance.title,
      'feedback_description': instance.feedbackDescription,
    };
