import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';
import 'package:trailerfilm_app/model/movie_response.dart';
import 'package:trailerfilm_app/repository/repository.dart';

class MoviesListByGenreBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getMoviesByGenre(int id) async {
    MovieResponse response = await _repository.getMovieByGenre(id);
    _subject.sink.add(response);
  }

  void drainStream() { _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get Subject => _subject;
}

final moviesByGenreBloc = MoviesListByGenreBloc();