import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:trailerfilm_app/model/auth.dart';
import 'package:trailerfilm_app/model/movie.dart';
import 'package:trailerfilm_app/model/movie_response.dart';
import 'package:trailerfilm_app/repository/search_movies.dart';
import 'package:trailerfilm_app/screens/detail_screen.dart';
import 'package:trailerfilm_app/theme/colors.dart' as Style;
import 'package:trailerfilm_app/widgets/top_rated_movie.dart';
import 'package:trailerfilm_app/widgets/card_tinder.dart';
import 'package:trailerfilm_app/widgets/check_login.dart';
import 'package:trailerfilm_app/app.dart' as globals;
import 'package:trailerfilm_app/widgets/user_profile.dart';

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

  @override
  Widget build(BuildContext context) {
    var widget = searchBar.isSearching.value ? 
    SearchMoviesWidget(movieResponse)
    : Expanded(child: Text("No result"),);
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: searchBar.build(context),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader( //NetworkImage
              accountName: new Text("Thien"), //_currentuser.displayname
              accountEmail: new Text("thienhenry0103@gmail.com"), //__currentuser.email
              currentAccountPicture: new Container(
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(""), //_currentuser.AvatarURL
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
      body:
        PageView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: onPageChanged,
          children: <Widget>[
            CardTinder(),
            BestMovies(),
            widget,
            Text("Notification"),
            UserProfile(),
          ]),
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
          onTap: navigationTapped,
        ),
      ),
    );
  }
}

class SearchMoviesWidget extends StatelessWidget {
  MovieResponse movieResponse;
  SearchMoviesWidget(this.movieResponse);
  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('The movie not found!'),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Done',
        textColor: Colors.white,
        onPressed: () {
          print('Done pressed!');
        }
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(Object context) {
    List<Movie> movies;
    print("response" + movieResponse.toString());
    if (movieResponse != null)
    {
      movies = movieResponse.movies;
      return Expanded(
        child: ListView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        movies[index].backPoster != null ?
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(movie: movies[index]),
                            ),
                          )
                        : showSnackBar(context);
                      },
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Hero(
                              tag: movies[index].id,
                              child: Container(
                                height: 150,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: movies[index].poster != null ? NetworkImage(
                                      "https://image.tmdb.org/t/p/w200/" + movies[index].poster
                                    ) :
                                    AssetImage("assets/image/empty.gif")
                                  )
                                )
                              ),
                            ),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      movies[index].title,
                                      // overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    RatingBar.builder(
                                      itemSize: 10.0,
                                      initialRating: movies[index].rating / 2,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                      itemBuilder: (context, _) => Icon(
                                        EvaIcons.star,
                                        color: Style.Colors.secondColor,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 240,
                                      child: Text(
                                        movies[index].overview,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
    }
      
    else {
      return Expanded(
        child: Center(child: Text("No result"),)
      );
    };
  }

}