import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:trailerfilm_app/services/auth_repo.dart';
import 'dart:convert' show utf8;
import 'package:trailerfilm_app/services/locator.dart';


class StorageRepo {
  FirebaseStorage storage = FirebaseStorage(storageBucket: "gs://login-new-b3ff7.appspot.com");
  AuthRepo _authRepo = locator.get<AuthRepo>();

Future<String> uploadFile(File file) async{
    var user = await _authRepo.getUser() ;
    var storageRef = storage.ref().child("user/profile/${user.uid}");
    var uploadTask = storageRef.putFile(file);
    //
    String downUrl = await storageRef.getDownloadURL();
    // String downUrl = await completeTask.ref.getDownloadURL();
    return downUrl;
  }
  Future<String> uploadInfo(String FullName) async{
    var encodedname = utf8.encode(FullName);
    var user = await _authRepo.getUser() ;
    var storageRef = storage.ref().child("user/profile/hello/${user.uid}");
    var uploadTask = await storageRef.putData(encodedname);
    //var completeTask = await uploadTask.onComplete;
    var decoded = utf8.decode(encodedname);
    return encodedname.toString();
  }

}