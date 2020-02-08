import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';

class Database {
  final Db db = Db("mongodb://104.248.136.110:27017");

  Future connectDB() async {
    await db.open();
    db.listDatabases().then((v) => print(v));
  }
}
