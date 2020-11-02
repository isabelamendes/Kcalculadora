import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:kcalculadora/pages/alimentos/listaAlimentos.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:kcalculadora/components/views.dart';

class Diario extends StatefulWidget {
  User user;

  Diario(User user) {
    this.user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyDiario(this.user);
  }
}

class _MyDiario extends State<Diario> {

  var _context;
  User user;

  _MyDiario(User user) {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: primaryBackgroundView(),
                child: diarioView(),
              )
            )
          ])
        )
      )
    );
  }
}

