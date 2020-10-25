import 'package:flutter/material.dart';
import 'package:mess_management_web/core/viewmodels/home_model.dart';
import 'package:mess_management_web/core/viewmodels/view_data_model.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

// TODO: Add validators
class AddMemberPage extends StatefulWidget {
  final bool isStudent;

  const AddMemberPage({Key key, this.isStudent}) : super(key: key);

  @override
  _AddMemberPageState createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add ${widget.isStudent ? 'Student' : 'Worker'}',
              style: b90_20_600,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    AddField(
                        text: 'Enrollment',
                        onSaved: (value) {
                          Provider.of<ViewDataModel>(context, listen: false)
                              .tempUser
                              .enrollmentNo = value;
                        }),
                    AddField(
                        text: 'Name',
                        onSaved: (value) {
                          Provider.of<ViewDataModel>(context, listen: false)
                              .tempUser
                              .fullName = value;
                        }),
                    AddField(
                        text: 'Phone',
                        onSaved: (value) {
                          Provider.of<ViewDataModel>(context, listen: false)
                              .tempUser
                              .phone_no = value;
                        }),
                    AddField(
                        text: 'Date of Birth',
                        onSaved: (value) {
                          Provider.of<ViewDataModel>(context, listen: false)
                              .tempUser
                              .dateOfBirth = value;
                        }),
                    AddField(
                        text: 'Bhawan',
                        onSaved: (value) {
                          Provider.of<ViewDataModel>(context, listen: false)
                              .tempUser
                              .bhawan = value;
                        }),
                    if (widget.isStudent) ...[
                      AddField(
                          text: 'Year',
                          onSaved: (value) {
                            Provider.of<ViewDataModel>(context, listen: false)
                                .tempStudent
                                .yearNo = int.parse(value);
                          }),
                      AddField(
                          text: 'Branch',
                          onSaved: (value) {
                            Provider.of<ViewDataModel>(context, listen: false)
                                .tempStudent
                                .branch = value;
                          }),
                      AddField(
                          text: 'Email',
                          onSaved: (value) {
                            Provider.of<ViewDataModel>(context, listen: false)
                                .tempStudent
                                .email = value;
                          })
                    ],
                    if (!widget.isStudent) ...[
                      AddField(
                          text: 'Salary',
                          onSaved: (value) {
                            Provider.of<ViewDataModel>(context, listen: false)
                                .tempWorker
                                .salary = double.parse(value);
                          }),
                      AddField(
                          text: 'Role',
                          onSaved: (value) {
                            Provider.of<ViewDataModel>(context, listen: false)
                                .tempWorker
                                .workerRole = value;
                          }),
                      AddField(
                          text: 'Shift start',
                          onSaved: (value) {
                            Provider.of<ViewDataModel>(context, listen: false)
                                .tempWorker
                                .shiftStart = value;
                          }),
                      AddField(
                          text: 'Shift end',
                          onSaved: (value) {
                            Provider.of<ViewDataModel>(context, listen: false)
                                .tempWorker
                                .shiftEnd = value;
                          }),
                    ]
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            AppButton(
              text: 'SUbMIT',
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  bool added = widget.isStudent
                      ? await Provider.of<ViewDataModel>(context, listen: false)
                          .addStudent()
                      : await Provider.of<ViewDataModel>(context, listen: false)
                          .addWorker();
                  if (added == true) {
                    Provider.of<HomeModel>(context, listen: false).activeIndex =
                        widget.isStudent ? 4 : 5;
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class AddField extends StatelessWidget {
  final String text;
  final Function(String) onSaved;

  const AddField({Key key, this.text, this.onSaved}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: text, labelText: text, contentPadding: EdgeInsets.all(2)),
        validator: (value) {
          if (value.isEmpty) {
            return "Field cannot be empty";
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}