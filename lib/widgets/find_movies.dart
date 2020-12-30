import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trailerfilm_app/widgets/result_movies.dart';

class FindMovies extends StatefulWidget {
  @override
  _FindMoviesState createState() => _FindMoviesState();
}

class _FindMoviesState extends State<FindMovies> {
  TextEditingController searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Row(children: <Widget>[
              Flexible(
                child: TextField(
                  controller: searchTextController, 
                  decoration:InputDecoration(hintText: 'Enter a search term'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search Movies',
                onPressed: () {
                  setState(() {
                    searchText = searchTextController.text;
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                },
              ),
            ]),
          padding: EdgeInsets.all(10),
          ),
          if (searchText.length > 0)
            ResultMovies(query: searchText),
        ],
      )
    );
  }
}