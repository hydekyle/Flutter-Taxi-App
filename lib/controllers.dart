import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi2/models.dart';

class Database {
  FirebaseApp firebaseApp;
  FirebaseDatabase database;

  void _init() async {
    firebaseApp = await FirebaseApp.configure(
        name: "Taxi2",
        options: FirebaseOptions(
            googleAppID: '1:11952598901:android:28b10e336b87bcdd43ad3c',
            apiKey: 'AIzaSyB0Vnfx6chYpksbHvpax_rx0a4NluBAcTo',
            databaseURL: 'https://taxiapp-1570825452403.firebaseio.com'));
    print("¡configured $firebaseApp");
    database = FirebaseDatabase(app: firebaseApp);
    print("y database también: $database");
  }

  Database() {
    if (firebaseApp == null) _init();
  }

  // final CollectionReference _taxisReference =
  //     Firestore.instance.collection('users');

  void uploadTest(UserConfig configData) async {
    print("por q...");
    print(database.app);

    await database
        .reference()
        .child("pinga")
        .update({"polla": 13}).then((onValue) => print("q ha pachao"));

    print("a ver si hago lo otro...");

    database
        .reference()
        .child("pinga")
        .once()
        .then((onValue) => print("v $onValue"));
    // database
    //     .reference()
    //     .child("users")
    //     .once()
    //     .then((onValue) => print("vaaaya $onValue"));
    // await FirebaseDatabase.instance.reference().child('users').update(
    //     {"Flutter funciona": "ok"}).then((onValue) => print("Updateado?"));
    // await FirebaseDatabase.instance
    //     .reference()
    //     .child('users')
    //     .once()
    //     .then((onValue) => print(onValue));
    // print("Termino!");
  }
}

class MyStorage {
  final FlutterSecureStorage deviceStorage = FlutterSecureStorage();

  Future _readByKey(String key) {
    return deviceStorage
        .read(key: key)
        .then((onValue) => onValue)
        .catchError((onError) => onError);
  }

  Future _saveByKey(String key, String value) {
    return deviceStorage
        .write(key: key, value: value)
        .then((onValue) => onValue)
        .catchError((onError) => onError);
  }

  Future readUsername() {
    return _readByKey("username");
  }

  Future saveUsername(String username) {
    return _saveByKey("username", username);
  }
}
