import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:kcalculadora/pages/alimentos/listaAlimentos.dart';
import 'package:kcalculadora/utils/constantes.dart';


class Consumo extends StatefulWidget {
  User user;

  Consumo(User user) {
    this.user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyConsumo(this.user);
  }
}

class _MyConsumo extends State<Consumo> {

  var _context;
  User user;

  _MyConsumo(User user) {
    this.user = user;
  }

  _toListaAlimentosView() {
    setState((){
      Navigator.push(_context,
        MaterialPageRoute(
          builder: (BuildContext context) {
          return ListaAlimentos();
        })
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Center(
      child: Column(
        children: [
          Text('DATA'),        
          Text('NOME DA PESSOA'),
          Text('CALORIAS PERMITIDAS'),        
          Text('CALORIAS CONSUMIDAS'),
          Text('CALORIAS RESTANTES'),
          Text('USER: ' + this.user.username),
          Text('Senha: ' + this.user.password),
          Text('TEMOS WIFIIIIIIII!'),
            SimpleRoundButton(
              backgroundColor: PRIMARY_THEME_COLOR,
              buttonText: Text(
                "Adicionar Alasdasdaimento",
                style: TextStyle(
                  color: Colors.white
                  )
              ),
              onPressed: () => _toListaAlimentosView(),
            ),
        ]
      ),
    );
  }
}

