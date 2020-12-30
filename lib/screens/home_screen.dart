import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trailerfilm_app/theme/colors.dart' as Style;
import 'package:trailerfilm_app/widgets/find_movies.dart';
import 'package:trailerfilm_app/widgets/top_rated_movie.dart';
import 'package:trailerfilm_app/widgets/card_tinder.dart';
import 'package:trailerfilm_app/widgets/check_login.dart';
import 'package:trailerfilm_app/app.dart' as globals;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _title;

  @override
  initState() {
    _title = 'Home';
  }

  final List<Widget> _widgetOptions = <Widget> [
    CardTinder(),
    BestMovies(),
    FindMovies(),
    Text(
      'Notification'
    ),
    CheckLogin(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index) { 
        case 0: { _title = 'Home'; } 
        break; 
        case 1: { _title = 'Top Rated'; } 
        break;
        case 2: { _title = 'Find'; } 
        break;
        case 3: { _title = 'Notification'; } 
        break;
        case 4: { _title = 'Account'; } 
        break; 
      } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(
            color: Style.Colors.titleColor,
          ),
        ),
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("${globals.username}"),
              accountEmail: new Text("thienhenry0103@gmail.com"),
              currentAccountPicture: new Container(
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${globals.avatar}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            new ListTile(
              title: Text('Favorite')
            ),
            new ListTile(
              title: Text('Settings')
            ),
          ],
        ),
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Style.Colors.mainColor,
          primaryColor: Colors.red,
          textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))
        ),
        child: new BottomNavigationBar(  
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment_rounded),
              label: 'Top Rated',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Find',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
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
      ),
    );
  }
}