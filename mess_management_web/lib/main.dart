import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess_management_web/ui/home/home_page.dart';
import 'ui/login/login_page.dart';
import 'router.dart' as myRouter;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mess Online',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.robotoTextTheme(),
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
      ),
      home: RootWidget(),
      onGenerateRoute: myRouter.Router.generateRoute,
    );
  }
}

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(1920, 960), allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mess Management System IIT Roorkee'),
      ),
      body: HomePage(),
    );
  }
}
