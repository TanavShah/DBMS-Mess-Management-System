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
                        worker: model.workers.elementAt(index),
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
                  )
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
              flex: 2,
            ),
            TableEntry('${user.fullName}', style: b90_14, flex: 2),
            TableEntry(
              '${user.phoneNo}',
              flex: 2,
            ),
            TableEntry(
              '${user.dateOfBirth.substring(0, 11)}',
              flex: 2,
            ),
            TableEntry(
              '${user.bhawan}',
              flex: 3,
            ),
            if (student != null) ...[
              TableEntry(
                '${student.email}',
                flex: 3,
              ),
              TableEntry(
                '${student.yearNo}',
                flex: 1,
              ),
              TableEntry(
                '${student.branch}',
                flex: 2,
              ),
            ],
            if (worker != null) ...[
              TableEntry(
                '${worker.salary}',
                flex: 2,
              ),
              TableEntry(
                '${worker.workerRole}',
                flex: 2,
              ),
              TableEntry(
                '${worker.shiftStart} to ${worker.shiftEnd}',
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
