import 'package:rxdart/subjects.dart';
import 'package:trailerfilm_app/model/movie_response.dart';
import 'package:trailerfilm_app/repository/repository.dart';

class NowPlayingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getPlayingMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get Subject => _subject;
}

final nowPlayingMoviesBloc = NowPlayingListBloc();