import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi2/models.dart';
import 'package:nima/nima_actor.dart';

ButtonBar saveButton(BuildContext context) {
  return ButtonBar(
    children: <Widget>[
      InkWell(
        onTap: () => Navigator.of(context).pushNamed("/welcome"),
        child: Center(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: SizedBox(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.15,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                " Guardar ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    backgroundColor: Color.fromRGBO(0, 150, 255, 0.8)),
              ),
            ),
          ),
        ),
      )
    ],
  );
}

TextFormField loginInput(BuildContext context) {
  return TextFormField(
    initialValue: Provider.of<Store>(context, listen: false).getMyUsername(),
    onChanged: (newValue) {
      Provider.of<Store>(context, listen: false).changeUsername(newValue);
    },
    decoration: InputDecoration(
        labelText: 'Identificación',
        filled: true,
        fillColor: Color.fromRGBO(0, 0, 255, 0.1),
        prefixText: "LM"),
  );
}

TextFormField passwordInput(BuildContext context) {
  return TextFormField(
    initialValue: "myPassword",
    onChanged: (newValue) {
      //inputPassword = newValue;
    },
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Contraseña',
      filled: true,
      fillColor: Color.fromRGBO(0, 0, 255, 0.1),
    ),
  );
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

AppBar topBar(BuildContext context) {
  return AppBar(
    title: Text('Taxi Laguna'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.local_taxi),
        onPressed: () {
          Navigator.of(context).pushNamed("/login");
        },
      )
    ],
  );
}

Column myBody(BuildContext context) {
  return Column(
    children: <Widget>[
      Tooltip(
        message: "Taxi Laguna",
        child: SizedBox(
          height: 100.0,
          width: 100.0,
          child: NimaActor(
            "assets/anims/nimaTest.nima",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "Untitled",
          ),
        ),
      ),
      Text(
          "¡Hola ${Provider.of<Store>(context, listen: false).userConfig.username}!")
    ],
  );
}

ButtonBar statusButton(BuildContext context) {
  return ButtonBar(
    children: <Widget>[
      InkWell(
        onTap: () => onStatusButton(context),
        child: Center(
          heightFactor: 1.0,
          widthFactor: 1.0,
          child: SizedBox(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.15,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                " Ocupado/Libre ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    backgroundColor: Color.fromRGBO(255, 0, 0, 1.0)),
              ),
            ),
          ),
        ),
      )
    ],
  );
}

void onStatusButton(BuildContext context) {
  String myName = Provider.of<Store>(context, listen: false).getMyUsername();
  if (myName.toUpperCase() == "ADMIN")
    Navigator.of(context).pushNamed("/admin");
  else
    print("Vete acostarte");
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Taxi Laguna',
        home: Scaffold(
            appBar: topBar(context),
            body: myBody(context),
            bottomNavigationBar: statusButton(context)));
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

// final testButton = InkWell(
//       onTap: () => UserConfig().readMyUsername(),
//       child: Center(
//         heightFactor: 1.0,
//         widthFactor: 1.0,
//         child: SizedBox(
//           height: 100.0,
//           width: MediaQuery.of(context).size.width / 1.15,
//           child: FittedBox(
//             fit: BoxFit.fill,
//             child: Text(
//               " Leer usuario ",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   backgroundColor: Color.fromRGBO(255, 0, 0, 1.0)),
//             ),
//           ),
//         ),
//       ),
//     );

//     final testButton2 = InkWell(
//       onTap: () => UserConfig().saveMyUsername(
//           Provider.of<Store>(context, listen: false).getMyUsername()),
//       child: Center(
//         heightFactor: 1.0,
//         widthFactor: 1.0,
//         child: SizedBox(
//           height: 100.0,
//           width: MediaQuery.of(context).size.width / 1.15,
//           child: FittedBox(
//             fit: BoxFit.fill,
//             child: Text(
//               " Save usuario ",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   backgroundColor: Color.fromRGBO(255, 0, 0, 1.0)),
//             ),
//           ),
//         ),
//       ),
//     );

//     final testButton3 = InkWell(
//       onTap: () => Provider.of<Store>(context, listen: false)
//           .database
//           .testButton(UserConfig.testingConfig()),
//       child: Center(
//         heightFactor: 1.0,
//         widthFactor: 1.0,
//         child: SizedBox(
//           height: 100.0,
//           width: MediaQuery.of(context).size.width / 1.15,
//           child: FittedBox(
//             fit: BoxFit.fill,
//             child: Text(
//               " ¡Test Button! ",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   backgroundColor: Color.fromRGBO(255, 0, 0, 1.0)),
//             ),
//           ),
//         ),
//       ),
//     );
