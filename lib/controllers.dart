import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi2/models.dart';
import 'dart:math' as math;
import 'secrets.dart';

class Database {
  FirebaseApp firebaseApp;
  FirebaseDatabase database;

  Database() {
    if (firebaseApp == null) _init();
  }

  void _init() async {
    firebaseApp = await FirebaseApp.configure(
        name: "Taxi2",
        options: FirebaseOptions(
            googleAppID: Secrets.googleAppID,
            apiKey: Secrets.firebaseApiKey,
            databaseURL: Secrets.firebaseURL));
    print("¡Configured $firebaseApp!");
    database = FirebaseDatabase(app: firebaseApp);
    print("Y la database también: $database");
  }

  void testButton(UserConfig configData) async {
    await uploadOne(configData);
    readAll();
  }

  void readAll() async {
    database
        .reference()
        .child("users")
        .once()
        .then((onValue) => readSnapshot(onValue))
        .catchError((onError) => print("Error al leer db: $onError"));
  }

  void readSnapshot(DataSnapshot snapshot) {
    final values = snapshot.value as Map;
    for (final key in values.keys) {
      print("$key: ${values[key]}");
    }
  }

  Future uploadOne(UserConfig configData) {
    print("Uploading en ${database.app}");

    final String randomName = "randy" + math.Random().nextInt(100).toString();

    return database
        .reference()
        .child("users")
        .update(configData.toMapTest(randomName))
        .then((onValue) => print("Updateado"));
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
