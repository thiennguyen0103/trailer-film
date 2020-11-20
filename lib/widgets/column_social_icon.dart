import 'package:flutter/material.dart';
import 'package:trailerfilm_app/theme/colors.dart';

Widget getIcons(icon, count, size) {
  return Container(
    child: Column(
      children: <Widget>[
        Icon(icon, color: white, size: size),
        SizedBox(
          height: 5,
        ),
        Text(
          count,
          style: TextStyle(
              color: white, fontSize: 12, fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}