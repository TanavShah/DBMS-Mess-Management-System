import 'package:mess_management_web/core/models/feedback.dart';
import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/core/services/feedback_service.dart';
import 'package:mess_management_web/core/viewmodels/base_model.dart';

import '../../service_locator.dart';

class FeedBackModel extends BaseModel {
  final _feedbackService = locator<FeedbackService>();

  Future<bool> submitFeedback(String title, String feedbackDescription) async {
    String studentId = locator<AuthService>().user.enrollment;
    status = Status.LOADING;
    var added = await _feedbackService
        .submitFeedback(Feedback(studentId, title, feedbackDescription));
    status = Status.COMPLETED;
    return added;
  }
}
