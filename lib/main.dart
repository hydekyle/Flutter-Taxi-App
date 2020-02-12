import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:taxi2/views.dart';
import 'models.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Schedule(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: WelcomePage(),
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => LoginPage(),
        "/welcome": (BuildContext context) => WelcomePage(),
        "/admin": (BuildContext context) => AdminPage(),
      },
    );
  }
}
