import 'package:flutter/material.dart';

class Schedule with ChangeNotifier {
  UserConfig userConfig;

  Schedule() {
    init();
  }

  void init() {
    print("Schedule init");
    userConfig = UserConfig();
    userConfig.username = "HydeTesting";
  }

  void changeUsername(String newUsername) {
    userConfig.username = newUsername;
    notifyListeners();
  }
}

class UserConfig {
  String username;
}
