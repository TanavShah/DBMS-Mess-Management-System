import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/logo.png'),
        SizedBox(
          width: ScreenUtil().setWidth(256),
        ),
        Container(
          child: Form(
            child: Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enrollment ID',
                      hintText: 'Enrollment ID',
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(24),
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(48),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(8),
                    color: Colors.orange,
                    onPressed: () {},
                    child: Text('LOGIN'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
