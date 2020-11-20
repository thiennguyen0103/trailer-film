import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eva_icons_flutter/icon_data.dart';
import 'package:flutter/material.dart';
import 'package:trailerfilm_app/theme/colors.dart' as Style;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Style.white,),
        title: Text("Trailer Film App"),

      ),
    );
  }
}