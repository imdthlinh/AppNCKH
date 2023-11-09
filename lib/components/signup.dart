import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class signupPage extends StatefulWidget{
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage>{

  var notFormatedPass= "Passwords must be longer than 8 characters";
  var notFormatedEmail= "Email not available";
  var notAvailUser="Username not availlable";
  var unmatchedPass="Unmatched password";
  var userNotAvail=false;
  var passWrongFormat=false;
  var emailWrongFotmat=false;
  var passUnmatched=false;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController newUsername = new TextEditingController();
  TextEditingController newPass = new TextEditingController();
  TextEditingController newRepPass = new TextEditingController();
  TextEditingController newEmail = new TextEditingController();

  bool _showPass= false;
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
                        ]
                    )
                ),
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
                          child: Text("SIGN UP NOW", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 30
                          ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                          child: TextField(
                            controller: newEmail,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "EMAIL",
                                errorText: emailWrongFotmat ? notFormatedEmail: null,
                                labelStyle: TextStyle(
                                    color: Color(0xff000000), fontSize: 15)
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                          child: TextField(
                            controller: newUsername,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "USERNAME",
                                errorText: userNotAvail ? notAvailUser: null,
                                labelStyle: TextStyle(
                                    color: Color(0xff000000), fontSize: 15)
                            ),
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: <Widget>[
                                TextField(
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  obscureText: !_showPass,
                                  decoration: InputDecoration(
                                      errorText: passWrongFormat ? notFormatedPass: null,
                                      labelText: "PASSWORD",
                                      labelStyle: TextStyle(color: Color(0xff000000), fontSize: 15)
                                  ),
                                  controller: newPass,
                                ),
                                GestureDetector(
                                  onTap: onToggleShowPass,
                                  child: Text(
                                    _showPass ? "HIDE" :"SHOW",
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                        ),

                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: <Widget>[
                                TextField(
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  obscureText: !_showPass,
                                  decoration: InputDecoration(
                                      errorText: passUnmatched ? unmatchedPass: null,
                                      labelText: "CONFRIM PASSWORD",
                                      labelStyle: TextStyle(color: Color(0xff000000), fontSize: 15)
                                  ),
                                  controller: newRepPass,
                                ),
                                GestureDetector(
                                  onTap: onToggleShowPass,
                                  child: Text(
                                    _showPass ? "HIDE" :"SHOW",
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        8))),
                              ),
                              onPressed: onSignInClicked,
                              child: Text("SIGN UP", style: TextStyle(
                                  color: Colors.black, fontSize: 16),),
                            ),
                          ),
                        ),
                      ],
                    )
                )
            )
        )
    );
  }

  void onToggleShowPass(){
    setState(() {
      _showPass=!_showPass;
    });
  }

  void onSignInClicked(){
    setState(() {
      if (newPass.text.length < 8)  passWrongFormat=true;
      else passWrongFormat=false;
      if (!newUsername.text.contains('@')) emailWrongFotmat=true;
      else emailWrongFotmat=false;
      if (newPass != newRepPass) passUnmatched=true;
      else passUnmatched=false;
    });

  }
}
