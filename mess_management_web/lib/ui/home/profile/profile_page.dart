import 'package:flutter/material.dart';
import 'package:mess_management_web/styles.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
              'Amish Garg',
              style: b80_14_600,
            ),
            SizedBox(
              height: 8,
            ),
            Text('18114040', style: b60_14),
            SizedBox(
              height: 8,
            ),
            ProfileRow(item1: 'Bhawaan', item2: 'Rajendra Bhwan'),
            ProfileRow(item1: 'Bhawaan', item2: 'Rajendra Bhwan'),
            ProfileRow(item1: 'Bhawaan', item2: 'Rajendra Bhwan'),
            ProfileRow(item1: 'Bhawaan', item2: 'Rajendra Bhwan'),
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
