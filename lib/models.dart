import 'package:flutter/material.dart';

class Schedule with ChangeNotifier {
  UserConfig userConfig;

  Schedule() {
    if (userConfig == null) _init();
  }

  void _init() {
    print("Schedule init");
    userConfig = UserConfig.testingConfig();
  }

  void changeUsername(String newUsername) {
    userConfig.username = newUsername;
    notifyListeners();
  }

  String getMyUsername() {
    String myUsername = userConfig.username;
    return myUsername == null ? "" : myUsername;
  }
}

class UserConfig {
  String username;
  int seats;

  UserConfig(this.username);

  UserConfig.testingConfig() {
    username = "HydeTesting";
    seats = 9;
  }
}
