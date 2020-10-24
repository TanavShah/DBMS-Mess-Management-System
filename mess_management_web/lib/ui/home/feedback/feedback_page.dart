import 'package:flutter/material.dart';
import 'package:mess_management_web/core/viewmodels/feedback_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:provider/provider.dart';

class FeedBackPage extends StatefulWidget {
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  bool submitted = false;

  final controller1 = TextEditingController();

  final controller2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final maxLines = 5;
    return Center(
      child: Container(
        padding: EdgeInsets.all(32),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: [
            Text('Enter feedback', style: b90_20_600),
            SizedBox(
              height: 16,
            ),
            Consumer<FeedBackModel>(
              builder: (_, model, __) => Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Title cannot be empty";
                        }
                        return null;
                      },
                      controller: controller1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Title',
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: maxLines * 24.0,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Description cannot be empty";
                          }
                          return null;
                        },
                        controller: controller2,
                        maxLines: maxLines,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter a message",
                          fillColor: Colors.grey[300],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    model.loading
                        ? SizedBox(
                            height: 36,
                            width: 36,
                            child: CircularProgressIndicator(),
                          )
                        : AppButton(
                            text: 'Submit Feedback',
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                bool added = await model.submitFeedback(
                                    controller1.text, controller2.text);
                                if (added == true) {
                                  setState(() {
                                    submitted = true;
                                  });
                                  controller2.clear();
                                  controller1.clear();
                                } else {}
                              }
                            },
                          ),
                    if (submitted)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Feedback Submitted!',
                          style: b90_14.copyWith(color: Colors.green),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    final maxLines = 5;

    return Container(
      margin: EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "Enter a message",
          fillColor: Colors.grey[300],
          filled: true,
        ),
      ),
    );
  }
}
