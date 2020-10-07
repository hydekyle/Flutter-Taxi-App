import 'package:flutter/material.dart';
import 'components.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Taxi Laguna',
        home: Scaffold(
            appBar: welcomeTopBar(context),
            body: welcomeBody(context),
            bottomNavigationBar: statusButton(context)));
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Datos de usuario"),
        ),
        body: Column(
          children: <Widget>[
            loginInput(context),
            passwordInput(context),
          ],
        ),
        bottomNavigationBar: saveButton(context),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visor de taxis',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        body: Text("Vaaa"),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
