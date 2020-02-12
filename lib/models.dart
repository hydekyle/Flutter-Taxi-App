import 'package:flutter/material.dart';

import 'controllers.dart';

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

class UserConfig extends HydeTesting {
  String username;
  int seats;

  UserConfig();

  UserConfig.testingConfig() {
    username = "HydeTesting";
    seats = 9;
  }
}

class HydeTesting {
  void readMyUsername() async {
    String myUsername = await MyStorage().readUsername();
    if (myUsername != null)
      print("Soy $myUsername");
    else
      print("Aún no existo...");
  }

  void saveMyUsername(String username) async {
    String result = await MyStorage().saveUsername(username);
    print(result);
  }
}
