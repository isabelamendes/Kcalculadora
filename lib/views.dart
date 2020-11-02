import 'package:flutter/material.dart';
import 'database/models.dart';

Widget homePageView() {
  
}

Widget loginView() {

}

Widget signUpView() {

}

Widget biografiaView(nameImage, biografia) {
  return Center(
    child: Column(children: [
      Text('BIOGRAFIA'),
      Image(image: AssetImage(nameImage), height: 300, fit: BoxFit.fitHeight),
      Text(biografia),
    ]),
  );
}

Widget generateTelaPrincipal(User user) {
  return Center(
    child: Column(
      children: [
        Text('DATA'),        
        Text('NOME DA PESSOA'),
        Text('CALORIAS PERMITIDAS'),        
        Text('CALORIAS CONSUMIDAS'),
        Text('CALORIAS RESTANTES'),
        Text('USER: ' + user.username),
        Text('Senha: ' + user.password),
        Text('Calorias: ' + user.calorias),
        FlatButton(
                color: Colors.purple,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.black,
                //onPressed: _telaListaAlimentos,
                child: Text(
                  "Adicionar calorias",
                  style: TextStyle(fontSize: 20.0), 
                ),
        ),
      ]
    ),
  );
}



