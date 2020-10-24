import 'package:mess_management_web/core/api/feedback_list.dart';
import 'package:mess_management_web/core/models/feedback.dart';
import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/core/services/feedback_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';

import '../../service_locator.dart';

class FeedBackModel extends BaseModel {
  final _feedbackService = locator<FeedbackService>();

  FeedbackList _feedbacks;

  FeedbackList get feedbacks => _feedbacks;

  FeedBackModel() {
    getFeedbacksList();
  }

  set feedbacks(FeedbackList value) {
    _feedbacks = value;
    notifyListeners();
  }

  Future<bool> submitFeedback(String title, String feedbackDescription) async {
    String studentId = locator<AuthService>().user.enrollmentNo;
    status = Status.LOADING;
    var added = await _feedbackService
        .submitFeedback(FeedBack(studentId, title, feedbackDescription));
    status = Status.COMPLETED;
    return added;
  }

  Future<void> getFeedbacksList() async {
    status = Status.LOADING;
    var list = await _feedbackService.getFeedBacks();
    feedbacks = list;
    status = Status.COMPLETED;
  }
}
