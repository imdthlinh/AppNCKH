import 'package:flutter/material.dart';

import 'package:my_flutter_project/components/signup.dart';
import 'package:my_flutter_project/components/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signupPage(),
    );
  }
}