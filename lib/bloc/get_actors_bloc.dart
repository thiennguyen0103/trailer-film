import 'package:rxdart/subjects.dart';
import 'package:trailerfilm_app/model/actor_response.dart';
import 'package:trailerfilm_app/repository/repository.dart';

class MoviesListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<ActorResponse> _subject = BehaviorSubject<ActorResponse>();

  getActors() async {
    ActorResponse response = await _repository.getActors();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ActorResponse> get Subject => _subject;
}

final actorsBloc = MoviesListBloc();