import 'package:flutter/material.dart';
import 'components/login.dart';
import 'layoutPrincipal.dart';

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
      home: MyHomePage(title: 'Kcalculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  var _context;
  void _telaPrincipal() {
    setState((){
      Navigator.push(_context,
        MaterialPageRoute(builder: (BuildContext context){
          return MyFirstBottomNavigationBar();
        })
      );
    });
  }

  
  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("NESSA TELA TEM Q TER CAMPO P USUARIO E SENHA", style: Theme.of(context).textTheme.headline4),
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
