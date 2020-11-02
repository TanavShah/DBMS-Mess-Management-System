import 'package:flutter/material.dart';
import 'package:mess_management_web/colors.dart';
import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/core/viewmodels/feedback_model.dart';
import 'package:mess_management_web/core/viewmodels/home_model.dart';
import 'package:mess_management_web/core/viewmodels/menu_model.dart';
import 'package:mess_management_web/core/viewmodels/view_data_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/home/add_data/add_data_page.dart';
import 'package:mess_management_web/ui/home/feedback/feedback_page.dart';
import 'package:mess_management_web/ui/home/feedback/view_feedbacks.dart';
import 'package:mess_management_web/ui/home/menu/mess_menu_page.dart';
import 'package:mess_management_web/ui/home/mess_data/mess_data_page.dart';
import 'package:mess_management_web/ui/home/mess_members/view_list_page.dart';
import 'package:mess_management_web/ui/home/profile/profile_page.dart';
import 'package:provider/provider.dart';

import '../../service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeModel()),
        ChangeNotifierProvider(create: (_) => MenuModel()),
        ChangeNotifierProvider(create: (_) => FeedBackModel()),
        ChangeNotifierProvider(create: (_) => ViewDataModel())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mess Management System'),
        ),
        drawer: NavDrawer(),
        body: Consumer<HomeModel>(
          builder: (_, model, ___) {
            return activePage(model.activeIndex);
          },
        ),
      ),
    );
  }

  Widget activePage(int index) {
    switch (index) {
      case 0:
        return MessMenuPage();
      case 1:
        return ProfilePage();
      case 2:
        return FeedBackPage();
      case 3:
        return ViewFeedbacks();
      case 4:
        return ViewListPage(isStudent: true);
      case 5:
        return ViewListPage(isStudent: false);
      case 6:
        return AddMemberPage(isStudent: true);
      case 7:
        return AddMemberPage(isStudent: false);
      case 8:
        return MessDataPage();
    }
    return MessMenuPage();
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
              index: 0,
            ),
            NavDrawerItem(
              title: 'My profile',
              index: 1,
            ),
            NavDrawerItem(
              title: 'Feedback',
              index: 2,
            ),
          ],
          if (locator<AuthService>().isWorker) ...[
            NavDrawerItem(
              title: 'Menu',
              index: 0,
            ),
            NavDrawerItem(
              title: 'View Profile',
              index: 1,
            ),
            NavDrawerItem(
              title: 'View FeedBacks',
              index: 3,
            ),
            NavDrawerItem(
              title: 'View Students',
              index: 4,
            ),
            NavDrawerItem(
              title: 'View Workers',
              index: 5,
            ),
            NavDrawerItem(
              title: 'Mess Data',
              index: 8,
            )
          ],
          ListTile(
            onTap: () async {
              locator<AuthService>().logout();
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
            },
            title: Text(
              'LOG OUT',
              style: b80_14_600,
            ),
          ),
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
                '${locator<AuthService>().user.enrollmentNo}',
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
  final int index;

  const NavDrawerItem({Key key, this.title, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Provider.of<HomeModel>(context, listen: false).activeIndex = index;
        Navigator.pop(context);
      },
      title: Text(
        title,
        style: b80_14,
      ),
    );
  }
}
