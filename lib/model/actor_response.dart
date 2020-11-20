import 'package:trailerfilm_app/model/actor.dart';

class ActorResponse {
  final List<Actor> actors;
  final String error;

  ActorResponse(this.actors, this.error);

  ActorResponse.fromJson(Map<String, dynamic> json)
    : actors = 
      (json["result"] as List).map((i) => new Actor.fromJson(i)).toList(),
      error = "";

  ActorResponse.withError(String errorValue)
    : actors = List(),
      error = errorValue;
}