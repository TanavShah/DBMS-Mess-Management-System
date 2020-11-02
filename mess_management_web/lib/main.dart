import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_web/colors.dart';
import 'package:mess_management_web/core/services/auth_service.dart';
import 'package:mess_management_web/service_locator.dart';
import 'router.dart' as myRouter;

String initRoute = 'login';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  bool loggedIn = await locator<AuthService>().checkUserLoggedIn();
  if (loggedIn == true) {
    initRoute = 'home';
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mess Online',
      theme: ThemeData(
        primarySwatch: appPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.robotoTextTheme(),
        appBarTheme: AppBarTheme(
          color: appOrange,
          textTheme:
              GoogleFonts.robotoTextTheme(),
        ),
      ),
      initialRoute: initRoute,
      onGenerateRoute: myRouter.Router.generateRoute,
    );
  }
}
