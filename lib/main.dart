import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trailerfilm_app/signin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SignIn(),
    );
  }
}