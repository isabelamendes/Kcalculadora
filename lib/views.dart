import 'package:flutter/material.dart';
import 'components/buttons/simple_round_icon_button.dart';
import 'components/buttons/simple_round_button.dart';
import 'components/loaders/flip_loader.dart';
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
        Text('TEMOS WIFIIIIIIII!'),
        SimpleRoundButton(
          backgroundColor: Color(0xFFfc6462),
          buttonText: Text(
            "Adicionar Alimento",
            style: TextStyle(
              color: Colors.white
              )
          ),
          onPressed: () {},
        ),        
         // icon: Icon(Icons.email),
        
      ]
    ),
  );
}



