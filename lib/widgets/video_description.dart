import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10.0,),
          Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Text('Description',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "The latest Avengers: Endgame trailer may have told us even less than we thought based on new information from the Russo brothers.AVENGERS: ENDGAME Poster Bathes Earth's Mightiest Heroes In The Light Of The Power Stone.",
                style: TextStyle(
                    color: Colors.white
                ),
              )
          ),
          SizedBox(height: 30.0),
          Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Text(
              "Cast",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 270,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_UX150_CR0,0,150,218_AL_.jpg",
                          fit: BoxFit.fill,
                          width: 100,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Robert Downey",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://m.media-amazon.com/images/M/MV5BMTU2NTg1OTQzMF5BMl5BanBnXkFtZTcwNjIyMjkyMg@@._V1_UY218_CR2,0,150,218_AL_.jpg",
                          fit: BoxFit.fill,
                          width: 100,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Chris Evans",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://m.media-amazon.com/images/M/MV5BNDQyNzMzZTMtYjlkNS00YzFhLWFhMTctY2M4YmQ1NmRhODBkXkEyXkFqcGdeQXVyNjcyNzgyOTE@._V1_UY218_CR12,0,150,218_AL_.jpg",
                          fit: BoxFit.fill,
                          width: 100,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Mark Ruffalo",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://m.media-amazon.com/images/M/MV5BMTM3OTUwMDYwNl5BMl5BanBnXkFtZTcwNTUyNzc3Nw@@._V1_UY218_CR15,0,150,218_AL_.jpg",
                          fit: BoxFit.fill,
                          width: 100,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Scarlet Johanson",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: RaisedButton(
                color: Colors.red,
                onPressed: (){},
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                child: Container(

                  child: Text("Buy Tickets",style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.white
                  ),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}