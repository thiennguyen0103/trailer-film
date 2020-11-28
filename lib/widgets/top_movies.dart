// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:trailerfilm_app/bloc/get_movies_bloc.dart';
// import 'package:trailerfilm_app/model/movie.dart';
// import 'package:trailerfilm_app/model/movie_response.dart';
// import 'package:trailerfilm_app/theme/colors.dart' as Style;

// class TopMovies extends StatefulWidget {
//   @override
//   _TopMoviesState createState() => _TopMoviesState();
// }

// class _TopMoviesState extends State<TopMovies> {
//   @override
//   void initState() {
//     super.initState();
//     moviesBloc..getMovies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(left: 10.0, top: 20.0),
//           child: Text(
//             "TOP RATED MOVIES",
//             style: TextStyle(
//               color: Style.Colors.titleColor,
//               fontWeight: FontWeight.w500,
//               fontSize: 12.0
//             ),
//           ),
//         ),
//         SizedBox(height: 5.0),
//         StreamBuilder<MovieResponse>(
//           stream: moviesBloc.subject.stream,
//           builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
//             if(snapshot.hasData) {
//               if(snapshot.data.error != null && snapshot.data.error.length > 0) {
//                 return _buildErrorWidget(snapshot.data.error);
//               }
//               _buildMoviesWidget(snapshot.data);
//             }
//             else if(snapshot.hasError) {
//               return _buildErrorWidget(snapshot.error);
//             }
//             else {
//               return _buildLoadingWidget();
//             }
//           }
//         )
//       ],
//     );
//   }

//   Widget _buildLoadingWidget() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(
//             height: 25.0,
//             width: 25.0,
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               strokeWidth: 4.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildErrorWidget(Object error) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text("Error occured: $error")
//         ],
//       ),
//     );
//   }

//   Widget _buildMoviesWidget(MovieResponse data) {
//     List<Movie> movies = data.movies;
//     return Container(
//       height: 116.0,
//       padding: EdgeInsets.only(left: 10.0),
//       child: ListView.builder(
//         itemCount: movies.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Container(
//             padding: EdgeInsets.only(top: 10.0, right: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 movies[index].profileImg == null ?
//                 Container(
//                   width: 70.0,
//                   height: 70.0,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Style.Colors.secondColor
//                   ),
//                   child: Icon(FontAwesomeIcons.userAlt, color: Colors.white),
//                 ) :
//                 Container(
//                   width: 70.0,
//                   height: 70.0,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(image: NetworkImage("" + actors[index].profileImg), fit: BoxFit.cover)
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   actors[index].name,
//                   maxLines: 2,
//                   style: TextStyle(
//                     height: 1.4,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 9.0
//                   ),
//                 ),
//                 SizedBox(height: 3.0),
//                 Text(
//                   "Trending for ${actors[index].known}",
//                   style: TextStyle(
//                     color: Style.Colors.titleColor,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 7.0
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       )
//     );
//   }
// }