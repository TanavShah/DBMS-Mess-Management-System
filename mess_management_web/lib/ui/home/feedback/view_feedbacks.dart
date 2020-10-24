import 'package:flutter/material.dart';
import 'package:mess_management_web/core/models/feedback.dart';
import 'package:mess_management_web/core/viewmodels/feedback_model.dart';
import 'package:provider/provider.dart';

class ViewFeedbacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FeedBackModel>(builder: (_, model, __) {
      final list = model.feedbacks != null
          ? List.generate(
              model.feedbacks.items.length,
              (index) => FeedbackListItem(
                  feedback: model.feedbacks.items.elementAt(index)))
          : [];
      return SingleChildScrollView(
        child: Column(
          children: [
            Text('Feedbacks'),
            ...list,
          ],
        ),
      );
    });
  }
}

class FeedbackListItem extends StatelessWidget {
  final FeedBack feedback;
  const FeedbackListItem({Key key, this.feedback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('${feedback.studentId}'),
          Text('${feedback.title}'),
          Text('${feedback.feedbackDescription}')
        ],
      ),
    );
  }
}
