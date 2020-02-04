import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;
String _username, _password;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Database Example',
    home: MyHomePage(),
  ));
}

Future connectMongo() async {
  final mongo.Db db = mongo.Db("mongodb://104.248.136.110:27017");
  await db.open();
  db.listDatabases().then((v) => print(v));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.app});
  final dynamic app;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: <Widget>[
          CustomTextField(
            onSaved: (input) {
              _username = input;
            },
            validator: (input) => input.isEmpty ? "*Required" : null,
            icon: Icon(Icons.person),
            hint: "USER",
          ),
          CustomTextField(
            icon: Icon(Icons.lock),
            obsecure: true,
            onSaved: (input) => _password = input,
            validator: (input) => input.isEmpty ? "*Required" : null,
            hint: "PASSWORD",
          ),
        ],
      ),
    ));
  }
}

Widget filledButton(String text, Color splashColor, Color highlightColor,
    Color fillColor, Color textColor, void function()) {
  return RaisedButton(
    highlightElevation: 0.0,
    splashColor: splashColor,
    highlightColor: highlightColor,
    elevation: 0.0,
    color: fillColor,
    shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
    ),
    onPressed: () {
      function();
    },
  );
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.icon,
      this.hint,
      this.obsecure = false,
      this.validator,
      this.onSaved});
  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String hint;
  final bool obsecure;
  final FormFieldValidator<String> validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        autofocus: true,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 30, right: 10),
            )),
      ),
    );
  }
}
