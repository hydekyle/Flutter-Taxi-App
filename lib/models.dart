import 'package:flutter/material.dart';

class Schedule with ChangeNotifier {
  UserConfig userConfig;

  void changeUsername(String newUsername) {
    userConfig.username = newUsername;
    notifyListeners();
  }
}

class UserConfig {
  String username;
}
