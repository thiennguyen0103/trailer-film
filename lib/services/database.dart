
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference favoriteMovies = FirebaseFirestore.instance.collection('favorite_movies');
  final CollectionReference userProfiles = FirebaseFirestore.instance.collection('profiles');
  Future updateFavoriteMovies(String movie_id) async{
    return await favoriteMovies.doc(uid).set({
      'movie_id': movie_id,
    });
  }
  Future updateUserProfile(String name, String email,String location) async{
    return await userProfiles.doc(uid).set({
      'name': name,
      'email': email,
      'location':location,
    });
  }
  Stream<QuerySnapshot> get getFavoriteMovies{
    return favoriteMovies.snapshots();
  }
  Stream<QuerySnapshot> get getUserProfile{
    return userProfiles.snapshots();
  }
}