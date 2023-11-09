import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'All texts',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
