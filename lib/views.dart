import 'package:atividade01/pages/forms.dart';
import 'package:flutter/material.dart';
import 'components/biografia.dart';
import 'utils/constantes.dart';
import 'database/models.dart';

/*Widget generateIsabelaView() {
  return biografia(URL_FOTO_ISABELA, BIOGRAFIA_ISABELA);
}

Widget generateLarissaView() {
  return biografia(URL_FOTO_LARISSA, BIOGRAFIA_LARISSA);
}
*/

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



