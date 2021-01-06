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
  ResultMovies resultMovies;

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
                onPressed: () async {
                  searchText = searchTextController.text;
                  await print(searchText);
                    resultMovies = ResultMovies(query: searchText);
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  setState(() {
                    
                  });
                },
              ),
            ]),
          padding: EdgeInsets.all(10),
          ),
          if (searchText.length > 0)
            resultMovies,
        ],
      )
    );
  }
}