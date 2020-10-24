import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/styles.dart';

import '../../../service_locator.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = locator<AuthService>();
    var list = [];
    if (auth.isWorker == true) {
      list.add(ProfileRow(
        item1: 'Role',
        item2: auth.worker.workerRole,
      ));
      list.add(ProfileRow(
        item1: 'Salary',
        item2: 'INR ${auth.worker.salary.toStringAsFixed(2)}',
      ));
      list.add(ProfileRow(
        item1: 'Shift',
        item2:
            '${Jiffy(auth.worker.shiftStart).Hm} to ${Jiffy(auth.worker.shiftEnd).Hm}',
      ));
    } else {
      list.add(ProfileRow(
        item1: 'Email',
        item2: auth.student.email,
      ));
      list.add(ProfileRow(
        item1: 'Year',
        item2: auth.student.year.toString(),
      ));
      list.add(ProfileRow(
        item1: 'Branch',
        item2: auth.student.branch,
      ));
    }
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 360,
        padding: EdgeInsets.all(24),
        decoration: cardDecorationDeepShadow,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/avatar.webp', scale: 8),
            SizedBox(
              width: 16,
            ),
            Text(
              '${auth.user.fullName}',
              style: b80_14_600,
            ),
            SizedBox(
              height: 8,
            ),
            Text('${auth.user.enrollmentNo}', style: b60_14),
            SizedBox(
              height: 8,
            ),
            ProfileRow(item1: 'Phone', item2: '${auth.user.phone}'),
            ProfileRow(
                item1: 'Date of Birth', item2: '${auth.user.dateOfBirth}'),
            ProfileRow(item1: 'Bhawan', item2: '${auth.user.bhawan}'),
            ...list,
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String item1;
  final String item2;
  const ProfileRow({Key key, this.item1, this.item2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item1, style: b80_14),
          Text(item2, style: b60_14),
        ],
      ),
    );
  }
}
