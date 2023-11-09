import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class loginPage extends StatefulWidget{
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>{

  var wrongCredentialErr= "Wrong username or passwords";
  var notFormatedPass= "Passwords must be longer than 8 characters";
  var userInvalid=false;
  var passInvalid=false;
  var passWrongFormat=false;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

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
                            child:
                            Container(
                              width: 70,
                              height: 70,
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/actvn_big_icon.png'),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                                color: Color(0xffd8d8d8),
                              ),
                            ),
                        ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                            child: Text("LOGIN", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 30
                            ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: TextField(
                              controller: userController,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "USERNAME",
                                  errorText: userInvalid ? wrongCredentialErr : null,
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
                                  errorText: passInvalid ? wrongCredentialErr : passWrongFormat ? notFormatedPass: null,
                                  labelText: "PASSWORD",
                                  labelStyle: TextStyle(color: Color(0xff000000), fontSize: 15)
                              ),
                              controller: passController,
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
                          child: Text("SIGN IN", style: TextStyle(
                              color: Colors.black, fontSize: 16),),
                        ),
                      ),
                    ),

                    Column(
                      children:<Widget>[
                        Container(
                          height: 100,
                          width: double.infinity,
                          child: TextButton(
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(fontSize: 15, color: Colors.black)
                            ),
                            onPressed: (){
                              _launchURL("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
                            },
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          child: TextButton(
                            child: Text(
                                "Forgot passwords or username?",
                                style: TextStyle(fontSize: 15, color: Colors.black)
                            ),
                            onPressed: (){
                              _launchURL("https://www.youtube.com/watch?v=y6120QOlsfU");
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
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
      if (passController.text.length < 8)  passWrongFormat=true;
      else passWrongFormat=false;
      if (!passInvalid && !userInvalid) {
        //Navigator.push(context, MaterialPageRoute(builder: gotoHome));
      }
    });

  }
  // Widget gotoHome(BuildContext context){
  //   return HomePage();
  // }
}
