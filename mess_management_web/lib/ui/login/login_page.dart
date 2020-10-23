import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text('Mess Management System IIT Roorkee'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', scale: 1.2),
              SizedBox(
                height: 32,
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
                              : AppButton(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      bool ok = await model.login(
                                          controller1.text, controller2.text);
                                      if (ok == true) {
                                        Navigator.pushNamed(context, 'home');
                                      } else {
                                        setState(() {
                                          invalid = false;
                                        });
                                      }
                                    }
                                  },
                                  text: 'login',
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
    );
  }
}
