import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mess_management_web/colors.dart';
import 'package:mess_management_web/core/viewmodels/login_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool invalid = false;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginModel(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: null,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.orange[600],
                Colors.orange[500],
                Colors.orange[400],
                Colors.orange[300],
              ],
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: cardDecorationDeepShadow,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', scale: 1.2),
                  SizedBox(
                    height: 48,
                  ),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: controller1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enrollment ID',
                                hintText: 'Enrollment ID',
                              ),
                              validator: (value) {
                                if (value.length != 8) {
                                  return "Enter 8 digit Enrollment Id";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: controller2,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Password',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter your password";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 48,
                            ),
                            Consumer<LoginModel>(
                              builder: (_, model, __) => model.loading
                                  ? SizedBox(
                                      width: 36,
                                      height: 36,
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    )
                                  : RaisedButton(
                                      padding: EdgeInsets.all(24),
                                      color: appOrange,
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          bool ok = await model.login(
                                              controller1.text,
                                              controller2.text);
                                          if (ok == true) {
                                            Navigator.pushNamed(
                                                context, 'home');
                                          } else {
                                            setState(() {
                                              invalid = false;
                                            });
                                          }
                                        }
                                      },
                                      child: Text(
                                        'login'.toUpperCase(),
                                        style: white_14_600,
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            if (invalid == true)
                              Center(
                                child: Text(
                                  'Invalid Enrollment Id or Password',
                                  style: appRed_12,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
