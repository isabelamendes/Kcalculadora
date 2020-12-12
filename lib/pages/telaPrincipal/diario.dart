import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:kcalculadora/pages/alimentos/listaAlimentos.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:kcalculadora/components/views.dart';

class Diario extends StatefulWidget {
  UserKcal user;

  Diario(UserKcal user) {
    this.user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyDiario(this.user);
  }
}

class _MyDiario extends State<Diario> {

  var _context;
  UserKcal user;

  _MyDiario(UserKcal user) {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: primaryBackgroundView(),
        child: Column(
          children: [
            diarioView(),
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: SimpleRoundButton(
                backgroundColor: PRIMARY_THEME_COLOR,
                buttonText: Text(
                  "Adicionar Alimento",
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onPressed: () => _toListaAlimentosView(),
              ),
            ),
            Divider(
              height: 25,
            ),
          ],
        )
      ),
    );
  }
}

