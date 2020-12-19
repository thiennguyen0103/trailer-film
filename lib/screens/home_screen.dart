import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:trailerfilm_app/theme/colors.dart' as Style;
import 'package:trailerfilm_app/widgets/best_movies.dart';
import 'package:trailerfilm_app/widgets/card_tinder.dart';
import 'package:trailerfilm_app/widgets/persons.dart';
import 'package:trailerfilm_app/widgets/genres.dart';
import 'package:trailerfilm_app/widgets/now_playing.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget> [
    CardTinder(),
    Text(
      'Raking'
    ),
    Text(
      'Find'
    ),
    Text(
      'Notification'
    ),
    Text(
      'User'
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Colors.white,),
        title: Text("Discover"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.settings, color: Colors.white,)
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // body: ListView(
      //   children: <Widget>[
      //     // CardTinder(),
      //     // NowPlaying(),
      //     // GenresScreen(),
      //     // PersonsList(),
      //     // BestMovies(),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Style.Colors.mainColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_rounded),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}