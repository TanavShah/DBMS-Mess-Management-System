import 'package:flutter/material.dart';
import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/home/profile/profile_page.dart';

import '../../service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mess Management System'),
      ),
      drawer: NavDrawer(),
      body: ProfilePage(),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: ListView(
        children: [
          NavDrawerHeader(),
          if (locator<AuthService>().isStudent) ...[
            NavDrawerItem(
              title: 'Menu',
            ),
            NavDrawerItem(
              title: 'My profile',
            ),
            NavDrawerItem(
              title: 'Feedback',
            )
          ],
          if (locator<AuthService>().isWorker) ...[
            NavDrawerItem(
              title: 'Menu',
            ),
            NavDrawerItem(
              title: 'View FeedBacks',
            ),
            NavDrawerItem(
              title: 'View Mess data',
            ),
            NavDrawerItem(
              title: 'View Profile',
            ),
          ],
        ],
      ),
    );
  }
}

class NavDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset('assets/avatar.webp', scale: 10.66),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${locator<AuthService>().user.fullName}',
                style: b80_14_600,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '${locator<AuthService>().user.enrollment}',
                style: b60_14,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NavDrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  const NavDrawerItem({Key key, this.title, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          title,
          style: b90_14,
        ),
      ),
    );
  }
}
