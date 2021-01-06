import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:trailerfilm_app/model/movie_response.dart';
import 'package:trailerfilm_app/repository/repository.g.dart';
import 'package:trailerfilm_app/theme/colors.dart' as Style;
import 'package:trailerfilm_app/widgets/find_movies.dart';
import 'package:trailerfilm_app/widgets/movies_by_genre.dart';
import 'package:trailerfilm_app/widgets/top_rated_movie.dart';
import 'package:trailerfilm_app/widgets/card_tinder.dart';
import 'package:trailerfilm_app/widgets/check_login.dart';

class HomeScreen extends StatefulWidget {
  // BaseAuth baseAuth;
  // String userName;
  // String email;
  // String avatar;
  // bool isLoggedin = false;
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex;
  String _title;
  int _counter;
  PageController _pageController;
  Duration pageChanging = Duration(milliseconds: 300);
  Curve animationCurve = Curves.linear;
  String searchQuery="";
  MovieResponse movieResponse;
  var widget;

  SearchBar searchBar;
  _HomeScreenState() {
    searchBar = new SearchBar(
      hintText: "Search...",
      setState: setState,
      inBar: true,
      closeOnSubmit: false,
      clearOnSubmit: false,
      onSubmitted: (String query) {
        if (query != null)
          setState(() {
            searchQuery = query;
            var call = SearchMovies.getIntance().search(searchQuery);
            call.then((result) {
              setState(() {
                this.movieResponse = result;
              });
            });
          });
      },
      buildDefaultAppBar: buildAppBar,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [searchBar.getSearchAction(context)],
      title: Text(
        _title,
        style: TextStyle(
          color: Style.Colors.titleColor,
        ),
      ),
      backgroundColor: Style.Colors.mainColor,
      centerTitle: true,
      elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
    );
  }
  
  void _incrementCounter() {
    setState(() {
      _counter++; 
    });
  }

  @override
  initState() {
    _title = 'Home';
    _counter = 0;
    _selectedIndex = 0;
    _pageController = PageController(initialPage: _selectedIndex);
  }
  
  void navigationTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: pageChanging,
      curve: animationCurve,
    );
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
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    if (this.mounted){
    setState(() {
      this._selectedIndex = page;
    });
  }}
  final List<Widget> _widgetOptions = <Widget> [
    CardTinder(),
    BestMovies(),
    FindMovies(),
    // FindMovies(),
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
    Size size = MediaQuery.of(context).size;
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // ExpansionTile(
            //   title: ),
            new UserAccountsDrawerHeader( //NetworkImage
              accountName: new Text("Thien"), //_currentuser.displayname
              accountEmail: new Text("thienhenry0103@gmail.com"), //__currentuser.email
              currentAccountPicture: CircularProfileAvatar(
                  "https://i.pravatar.cc/300",
                  borderWidth: 4.0,
                  radius: 60.0,
                ),
              ),
            ExpansionTile(
              title: Text(
                "Thể loại",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                new ListTile(
                  title: const Text('Phim Hành Động'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 28),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Phiêu Lưu'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 12),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Hoạt Hình'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 16),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Tài Liệu'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 99),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Chính Kịch'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 18),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Gia Đình'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 10751),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Giả Tượng'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 14),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Lịch Sử'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 36),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Hài'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 35),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Chiến Tranh'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 10752),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Hình Sự'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 80),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Ca Nhạc'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 10402),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Bí Ẩn'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 9648),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Lãng Mạn'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 10749),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Khoa Học Viễn Tưởng'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 878),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Kinh Dị'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 27),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text("Chương Trình Truyền Hình"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 10770),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Gây Cấn'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 53),
                      ),
                    );
                  },              
                ),
                new ListTile(
                  title: const Text('Phim Viễn Tây'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreMovies(genreId: 37),
                      ),
                    );
                  },              
                ),
              ]
            ),
            new ListTile(
              title: Text("Yêu thích",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),  
              ),
              onTap: () {

              },
            ),
            new ListTile(
              title: Text("Cài đặt",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),  
              ),
              onTap: () {

              },
            ),
          ]
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