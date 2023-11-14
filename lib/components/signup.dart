import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_project/components/login.dart';
import 'package:my_flutter_project/services/base_client.dart';
import 'package:my_flutter_project/services/validation.dart';

class signupPage extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final formKey = GlobalKey<FormState>();
  bool _showPass = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade800,
                      Colors.blue.shade400
                    ])),
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                        padding: EdgeInsets.all(32),
                        reverse: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                              child: Container(
                                width: 70,
                                height: 70,
                                padding: EdgeInsets.all(15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                              child: Text(
                                "SIGN UP NOW",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 30),
                              ),
                            ),
                            Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                              child: TextFormField(
                                validator: (value) =>
                                    !EmailValidator.validate(value!)
                                        ? 'Enter a valid email'
                                        : null,
                                controller: newEmail,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                    labelText: "EMAIL",
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: TextFormField(
                                controller: newUsername,
                                validator: (value) {
                                  if (value.toString().length < 3)
                                    return 'Username must be longer than 3 characters';
                                  else
                                    return null;
                                },
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                    labelText: "USERNAME",
                                    labelStyle: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: <Widget>[
                                    TextFormField(
                                      validator: (value) {
                                        if (value.toString().length < 8)
                                          return 'Passwords must be longer than 8 characters';
                                        else if (value.toString().contains(' '))
                                          return 'Passwords must not contains space';
                                        else
                                          return null;
                                      },
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      obscureText: !_showPass,
                                      decoration: InputDecoration(
                                          labelText: "PASSWORD",
                                          labelStyle: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 15)),
                                      controller: newPass,
                                    ),
                                    GestureDetector(
                                      onTap: onToggleShowPass,
                                      child: Text(
                                        _showPass ? "HIDE" : "SHOW",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(height: 20),
                            Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: <Widget>[
                                    TextFormField(
                                      validator: (value) {
                                        if (value != newPass.text)
                                          return 'Passwords not matched';
                                        else
                                          return null;
                                      },
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      obscureText: !_showPass,
                                      decoration: InputDecoration(
                                          labelText: "CONFIRM PASSWORD",
                                          labelStyle: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 15)),
                                      controller: newRepPass,
                                    ),
                                    GestureDetector(
                                      onTap: onToggleShowPass,
                                      child: Text(
                                        _showPass ? "HIDE" : "SHOW",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                  ),
                                  onPressed: () {
                                    signupMethod();
                                  },
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 100,
                              width: double.infinity,
                              child: TextButton(
                                child: Text("LOG IN",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black)),
                                onPressed: () {
                                  movetoLogin();
                                },
                              ),
                            ),
                          ],
                        ))))));
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void movetoLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => loginPage()));
  }

  void showTopSnackBarSignup(BuildContext context) => Flushbar(
        shouldIconPulse: false,
        title: 'Sign up successfully',
        message: 'Proceed to login page',
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        onTap: (_) {
          print('Clicked bar');
        },
      )..show(context);

  void signupMethod() {
    final form = formKey.currentState!;
    if (form.validate()) {
      signup(newEmail.text.toString(), newUsername.text.toString(),
          newPass.text.toString());
      if (isSuccessSignup) {
        movetoLogin();
        showTopSnackBarSignup(context);
      }
    }
  }
}
