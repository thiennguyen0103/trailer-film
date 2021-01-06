import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trailerfilm_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomeScreen(),
    );
  }
}