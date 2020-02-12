import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi2/controllers.dart';
import 'package:taxi2/models.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final saveButton = ButtonBar(
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
    final loginInput = TextFormField(
      initialValue:
          Provider.of<Schedule>(context, listen: false).getMyUsername(),
      onChanged: (newValue) {
        Provider.of<Schedule>(context, listen: false).changeUsername(newValue);
      },
      decoration: InputDecoration(
          labelText: 'Identificación',
          filled: true,
          fillColor: Color.fromRGBO(0, 0, 255, 0.1),
          prefixText: "LM"),
    );
    final passwordInput = TextFormField(
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

    final testButton = InkWell(
      onTap: () => readMyUsername(),
      child: Center(
        heightFactor: 1.0,
        widthFactor: 1.0,
        child: SizedBox(
          height: 100.0,
          width: MediaQuery.of(context).size.width / 1.15,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              " Leer usuario ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  backgroundColor: Color.fromRGBO(255, 0, 0, 1.0)),
            ),
          ),
        ),
      ),
    );

    final testButton2 = InkWell(
      onTap: () => saveMyUsername(
          Provider.of<Schedule>(context, listen: false).getMyUsername()),
      child: Center(
        heightFactor: 1.0,
        widthFactor: 1.0,
        child: SizedBox(
          height: 100.0,
          width: MediaQuery.of(context).size.width / 1.15,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              " Save usuario ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  backgroundColor: Color.fromRGBO(255, 0, 0, 1.0)),
            ),
          ),
        ),
      ),
    );

    return MaterialApp(
      title: "Login",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Datos de usuario"),
        ),
        body: Column(
          children: <Widget>[
            loginInput,
            passwordInput,
            testButton,
            testButton2
          ],
        ),
        bottomNavigationBar: saveButton,
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topBar = AppBar(
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
    final myBody = Column(
      children: <Widget>[
        Tooltip(
          message: "Taxi Laguna",
          child: Image(image: AssetImage('assets/icon.png')),
        ),
        Text(
            "¡Hola ${Provider.of<Schedule>(context, listen: false).userConfig.username}!")
      ],
    );
    final statusButton = ButtonBar(
      children: <Widget>[
        InkWell(
          onTap: () => {
            //setState(() => {buttonClient(context)})
          },
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
    return MaterialApp(
        title: 'Taxi Laguna',
        home: Scaffold(
            appBar: topBar, body: myBody, bottomNavigationBar: statusButton));
  }
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visor de taxis',
      home: Scaffold(
          //appBar: SliverAppBar(),
          //body: FutureBuilder(),
          ),
    );
  }
}

// TODO REMOVE TAL
// ! I better remove this
// ? Sure I should
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text('Taxi Laguna'),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Veces que he sido pulsado:'),
//             // Consumer looks for an ancestor Provider widget
//             // and retrieves its model (Counter, in this case).
//             // Then it uses that model to build widgets, and will trigger
//             // rebuilds if the model is updated.
//             Consumer<Counter>(
//               builder: (context, counter, child) => Text(
//                 '${counter.value}',
//                 style: Theme.of(context).textTheme.display1,
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // Provider.of is another way to access the model object held
//         // by an ancestor Provider. By default, even this listens to
//         // changes in the model, and rebuilds the whole encompassing widget
//         // when notified.
//         //
//         // By using `listen: false` below, we are disabling that
//         // behavior. We are only calling a function here, and so we don't care
//         // about the current value. Without `listen: false`, we'd be rebuilding
//         // the whole MyHomePage whenever Counter notifies listeners.
//         onPressed: () =>
//             Provider.of<Counter>(context, listen: false).increment(),
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
