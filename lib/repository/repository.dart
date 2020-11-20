import 'package:dio/dio.dart';
import 'package:trailerfilm_app/model/actor_response.dart';
import 'package:trailerfilm_app/model/genre_response.dart';
import 'package:trailerfilm_app/model/movie_response.dart';

class MovieRepository {
  // Enter your api key
  final String apiKey = "";
  // Enter your main url
  static String mainUrl = "";
  final Dio _dio = Dio();

  var getPopularUrl = '$mainUrl/';
  var getMoviesUrl = '$mainUrl/';
  var getPlayingUrl = '$mainUrl/';
  var getGenresUrl = '$mainUrl/';
  var getActorsUrl = '$mainUrl/';

  Future<MovieResponse> getMovies() async {
    var param = {
      "api_key": apiKey,
      "languge": "en-US",
      "page": 1
    };
    try {
      Response response = await _dio.get(getPopularUrl, queryParameters: param);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var param = {
      "api_key": apiKey,
      "languge": "en-US",
      "page": 1
    };
    try {
      Response response = await _dio.get(getPlayingUrl, queryParameters: param);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var param = {
      "api_key": apiKey,
      "languge": "en-US",
      "page": 1
    };
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: param);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<ActorResponse> getActors() async {
    var param = {
      "api_key": apiKey,
    };
    try {
      Response response = await _dio.get(getActorsUrl, queryParameters: param);
      return ActorResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ActorResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var param = {
      "api_key": apiKey,
      "languge": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: param);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
}