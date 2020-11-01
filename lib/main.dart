import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/template1/loginPage.dart';
import 'layoutPrincipal.dart';
import 'database/models.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade',
      theme: ThemeData(
        primaryColor: Color(0xFFD9A813),
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLoginPage(),
    );
  }
}

class Batata extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}
class _LoginPageState extends State<Batata> {
  var _context;
  void _telaPrincipal() {
    setState((){
      
    });
  }

  
  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("alo"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("USUARIO E SENHA", style: Theme.of(context).textTheme.headline4),
              FlatButton(
                color: Colors.pink[100],
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.black,
                onPressed: _telaPrincipal,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20.0),
                  
                ),
              ),
              /*FlatButton(
                color: Colors.purple,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.black,
                //onPressed: _telaCadastro,
                child: Text(
                  "Cadastrar",
                  style: TextStyle(fontSize: 20.0),
                  
                ),
              )*/
            ],
          ),
        ),
      ),    
    );
  }
}

