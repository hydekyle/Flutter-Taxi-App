import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Database {
  final Db db = Db("mongodb://104.248.136.110:27017");

  Future connectDB() async {
    await db.open();
    db.listDatabases().then((v) => print(v));
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
