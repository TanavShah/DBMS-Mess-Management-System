// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedBack _$FeedBackFromJson(Map<String, dynamic> json) {
  return FeedBack(
    json['enrollment_no'] as String,
    json['title'] as String,
    json['feedback_description'] as String,
  );
}

Map<String, dynamic> _$FeedBackToJson(FeedBack instance) => <String, dynamic>{
      'enrollment_no': instance.enrollmentNo,
      'title': instance.title,
      'feedback_description': instance.feedbackDescription,
    };
