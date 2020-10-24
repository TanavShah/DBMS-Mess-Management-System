import 'package:flutter/material.dart';
import 'package:mess_management_web/core/models/student.dart';
import 'package:mess_management_web/core/models/user.dart';
import 'package:mess_management_web/core/models/worker.dart';
import 'package:mess_management_web/core/viewmodels/view_data_model.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class ViewListPage extends StatelessWidget {
  final bool isStudent;
  const ViewListPage({Key key, this.isStudent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ViewDataModel>(builder: (_, model, __) {
      var list;
      if (isStudent) {
        list = model.students != null
            ? List.generate(
                model.students.length,
                (index) => TableRow(
                      student: model.students.elementAt(index),
                    ))
            : [];
      } else {
        list = model.workers != null
            ? List.generate(
                model.workers.length,
                (index) => TableRow(
                      student: model.students.elementAt(index),
                    ))
            : [];
      }
      return SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    isStudent ? 'Students' : 'Workers',
                    style: b90_20_600,
                  ),
                ),
                ...list,
                Center(
                  child: AppButton(
                    onPressed: () {},
                    text: isStudent ? 'ADD NEW STUDENT' : ' ADD NEW WORKER',
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class TableRow extends StatelessWidget {
  final Student student;
  final Worker worker;

  const TableRow({Key key, this.student, this.worker}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final User user = student != null ? student.user : worker.user;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: cardDecoration,
        child: Row(
          children: [
            TableEntry(
              '${user.enrollmentNo}',
              style: b90_14_600,
            ),
            TableEntry(
              '${user.fullName}',
              style: b90_14,
            ),
            TableEntry('${user.phone_no}'),
            TableEntry('${user.dateOfBirth.substring(0, 11)}'),
            TableEntry('${user.bhawan}'),
            if (student != null) ...[
              TableEntry('${student.email}'),
              TableEntry('${student.yearNo}'),
              TableEntry('${student.branch}'),
            ],
            if (worker != null) ...[
              TableEntry('${worker.salary}'),
              TableEntry('${worker.workerRole}'),
              TableEntry('${worker.shiftStart} to ${worker.shiftEnd}'),
            ]
          ],
        ),
      ),
    );
  }
}

class TableEntry extends StatelessWidget {
  final String text;
  final TextStyle style;
  const TableEntry(this.text, {this.style});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: style ?? b60_14,
        ),
      ),
    );
  }
}
