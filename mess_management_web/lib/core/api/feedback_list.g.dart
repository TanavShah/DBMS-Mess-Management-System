// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackList _$FeedbackListFromJson(Map<String, dynamic> json) {
  return FeedbackList(
    (json as List)
        ?.map((e) =>
            e == null ? null : FeedBack.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FeedbackListToJson(FeedbackList instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };
