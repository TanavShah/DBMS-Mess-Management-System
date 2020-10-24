import 'dart:async';
import 'dart:convert';

import 'package:mess_management_web/core/api/feedback_list.dart';
import 'package:mess_management_web/core/models/feedback.dart';
import 'package:mess_management_web/core/services/api.dart';
import 'package:mess_management_web/service_locator.dart';

class FeedbackService {
  final _api = locator<Api>();

  Future<bool> submitFeedback(FeedBack feedback) async {
    var response = _api.post(
      'feedback/add',
      jsonEncode(feedback.toJson()),
    );

    if (response != null) {
      return true;
    }
    return false;
  }

  Future<FeedbackList> getFeedBacks() async {
    var response = await _api.get('feedback');
    print(response[0]);
    var items = <FeedBack>[];
    if (response is List) {
      for (int i = 0; i < response.length; i++) {
        items.add(FeedBack.fromJson(response[i]));
      }
    }
    var data = FeedbackList(items);
    return data;
  }
}
