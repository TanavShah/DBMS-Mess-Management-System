import 'package:flutter/material.dart';
import 'package:mess_management_web/core/models/student.dart';
import 'package:mess_management_web/core/models/user.dart';
import 'package:mess_management_web/core/models/worker.dart';
import 'package:mess_management_web/core/viewmodels/home_model.dart';
import 'package:mess_management_web/core/viewmodels/view_data_model.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class ViewListPage extends StatelessWidget {
  final bool isStudent;
  const ViewListPage({Key key, this.isStudent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ViewDataModel>(
      builder: (_, model, __) {
        var list;
        if (isStudent) {
          list = model.students != null
              ? List.generate(
                  model.students.length + 1,
                  (index) => index == 0
                      ? TableRow(
                          isHeader: true, student: model.students.elementAt(0))
                      : TableRow(
                          student: model.students.elementAt(index - 1),
                        ))
              : [];
        } else {
          list = model.workers != null
              ? List.generate(
                  model.workers.length + 1,
                  (index) => index == 0
                      ? TableRow(
                          isHeader: true, worker: model.workers.elementAt(0))
                      : TableRow(
                          worker: model.workers.elementAt(index - 1),
                        ))
              : [];
        }
        return SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              constraints: BoxConstraints(maxWidth: 1080),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 8),
                    child: Text(
                      isStudent ? 'Students' : 'Workers',
                      style: b90_20_600,
                    ),
                  ),
                  ...list,
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: AppButton(
                        onPressed: () {
                          Provider.of<HomeModel>(context, listen: false)
                              .activeIndex = isStudent ? 6 : 7;
                        },
                        text: isStudent ? 'ADD NEW STUDENT' : ' ADD NEW WORKER',
                      ),
                    ),
                  ),
                  if (isStudent == false)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Center(
                        child: AppButton(
                          onPressed: () {
                            Provider.of<HomeModel>(context, listen: false)
                                .activeIndex = 9;
                          },
                          text: "Manage worker roles",
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TableRow extends StatelessWidget {
  final bool isHeader;
  final Student student;
  final Worker worker;

  const TableRow({Key key, this.student, this.worker, this.isHeader: false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final User user = student != null ? student.user : worker.user;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        decoration: cardDecoration,
        child: Row(
          children: [
            TableEntry(
              isHeader ? "Enrollment" : '${user.enrollmentNo}',
              style: b90_14_600,
              flex: 2,
            ),
            TableEntry(isHeader ? "Name" : '${user.fullName}',
                style: b90_14, flex: 2),
            TableEntry(
              isHeader ? "Phone" : '${user.phoneNo}',
              flex: 2,
            ),
            TableEntry(
              isHeader ? "DOB" : '${user.dateOfBirth.substring(0, 11)}',
              flex: 2,
            ),
            TableEntry(
              isHeader ? "Bhawan" : '${user.bhawan}',
              flex: 3,
            ),
            if (student != null) ...[
              TableEntry(
                isHeader ? "Email" : '${student.email}',
                flex: 3,
              ),
              TableEntry(
                isHeader ? "Year" : '${student.yearNo}',
                flex: 1,
              ),
              TableEntry(
                isHeader ? "Branch" : '${student.branch}',
                flex: 2,
              ),
            ],
            if (worker != null) ...[
              TableEntry(
                isHeader ? "Salary" : '${worker.salary}',
                flex: 2,
              ),
              TableEntry(
                isHeader ? "Role" : '${worker.workerRole}',
                flex: 2,
              ),
              TableEntry(
                isHeader
                    ? "Shift"
                    : '${worker.shiftStart} to ${worker.shiftEnd}',
                flex: 3,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class TableEntry extends StatelessWidget {
  final flex;
  final String text;
  final TextStyle style;
  const TableEntry(this.text, {this.style, this.flex});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
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
