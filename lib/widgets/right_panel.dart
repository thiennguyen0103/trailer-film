import 'package:flutter/material.dart';
import 'package:trailerfilm_app/widgets/trailer_film_icons.dart';
import 'column_social_icon.dart';

class RightPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  const RightPanel({
    Key key,
    @required this.size,
    this.likes,
    this.comments,
    this.shares,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.1,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getIcons(TrailerFilmIcons.heart, likes, 35.0),
                    getIcons(TrailerFilmIcons.chat_bubble, comments, 35.0),
                    getIcons(TrailerFilmIcons.reply, shares, 25.0),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}