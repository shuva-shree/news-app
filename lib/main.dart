import 'package:flutter/material.dart';
import 'package:newstoday/views/home_screen.dart';
// import 'package:newsapp/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

