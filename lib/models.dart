import 'package:flutter/material.dart';

class Schedule with ChangeNotifier {
  UserConfig userConfig;
  Color theColor;

  Schedule() {
    if (userConfig == null) _init();
  }

  void _init() {
    print("Schedule init");
    userConfig = UserConfig();
    userConfig.username = "HydeTesting";
    theColor = Colors.red;
  }

  void changeUsername(String newUsername) {
    userConfig.username = newUsername;
    notifyListeners();
  }

  void changeColor(Color color) {
    theColor = color;
    notifyListeners();
  }

  String getMyUsername() {
    return userConfig.username == null ? "" : userConfig.username;
  }
}

class UserConfig {
  String username;
}
