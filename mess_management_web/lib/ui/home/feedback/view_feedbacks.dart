import 'package:flutter/material.dart';
import 'package:mess_management_web/core/models/feedback.dart';
import 'package:mess_management_web/core/viewmodels/feedback_model.dart';
import 'package:mess_management_web/styles.dart';
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
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Feedbacks',
                    style: b90_20_600,
                  ),
                ),
                ...list,
              ],
            ),
          ),
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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: cardDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${feedback.enrollmentId}',
                style: b90_14,
              ),
            ),
            Container(
              width: 240,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${feedback.title}',
                  style: b90_14_600,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${feedback.feedbackDescription}',
                  style: b60_14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
