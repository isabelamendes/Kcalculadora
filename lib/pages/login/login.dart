import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/pages/telaPrincipal/telaNavegacao.dart';

class MyLoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<MyLoginPage> {
  var _context;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final User user = new User();

  _toTelaPrincipal(User user) {
    setState((){
      Navigator.push(_context,
        MaterialPageRoute(builder: (BuildContext context){
          return TelaNavegacao(user);
        })
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login") 
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (String inValue) {
                          if (inValue.length == 0) {
                            return "Please enter username";
                          }
                          return null;
                        },
                        onSaved: (String inValue) {
                          user.username = inValue;
                        }
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (String inValue) {
                        if (inValue.length < 10) {
                          return "Password precisa ser maior do que 10 characteres";
                        }
                        return null;
                      },
                      onSaved: (String inValue) {
                        user.password = inValue;
                      },
                    ),
                    RaisedButton(
                        child: Text("Log In!"),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            if (user.isValidUser()) {
                              _toTelaPrincipal(user);
                            } else {
                              
                            }
                          }
                        }
                    )
                  ],
                )
            )
          ) 
        )
      )
    );    
  }
}