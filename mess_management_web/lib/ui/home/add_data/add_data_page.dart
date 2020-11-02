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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add New ${widget.isStudent ? 'Student' : 'Worker'}',
                  style: b90_20_600,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.all(32),
                  decoration: cardDecorationDeepShadow,
                  width: MediaQuery.of(context).size.width * 0.5,
                  constraints: BoxConstraints(maxWidth: 360),
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
                                  .phoneNo = value;
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
                                Provider.of<ViewDataModel>(context,
                                        listen: false)
                                    .tempStudent
                                    .yearNo = int.parse(value);
                              }),
                          AddField(
                              text: 'Branch',
                              onSaved: (value) {
                                Provider.of<ViewDataModel>(context,
                                        listen: false)
                                    .tempStudent
                                    .branch = value;
                              }),
                          AddField(
                              text: 'Email',
                              onSaved: (value) {
                                Provider.of<ViewDataModel>(context,
                                        listen: false)
                                    .tempStudent
                                    .email = value;
                              })
                        ],
                        if (!widget.isStudent) ...[
                          AddField(
                              text: 'Role',
                              onSaved: (value) {
                                Provider.of<ViewDataModel>(context,
                                        listen: false)
                                    .tempWorker
                                    .workerRole = value;
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
                          ? await Provider.of<ViewDataModel>(context,
                                  listen: false)
                              .addStudent()
                          : await Provider.of<ViewDataModel>(context,
                                  listen: false)
                              .addWorker();
                      if (added == true) {
                        Provider.of<HomeModel>(context, listen: false)
                            .activeIndex = widget.isStudent ? 4 : 5;
                      }
                    }
                  },
                )
              ],
            ),
          ),
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
            hintText: text,
            labelText: text,
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            hintStyle: b60_12),
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
