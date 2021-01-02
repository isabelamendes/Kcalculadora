import 'package:flutter/material.dart';
import 'package:kcalculadora/database/diario_user_reference.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:kcalculadora/pages/alimentos/listaAlimentos.dart';
import 'package:kcalculadora/pages/alimentos/listaAlimentosDiario.dart';
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

  Future<List<Alimento>> alimentosHoje;

  Future<List<Alimento>> getAlimentosHoje() async {
    DiarioUserReference diarioUserReference = new DiarioUserReference();
    List<Alimento> alimentosHoje = await diarioUserReference.getAllAlimentosDiarioByUser(this.user);
    return alimentosHoje;
  }
  
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
          return ListaAlimentos(user);
        })
      );
    });
  }

  _toListaAlimentosHojeView() {
    setState((){
      Navigator.push(_context,
        MaterialPageRoute(
          builder: (BuildContext context) {
          return ListaAlimentosDiario(user);
        })
      );
    });
  }

  @override
  void initState() {
    this.alimentosHoje = getAlimentosHoje();
    super.initState();
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
            FutureBuilder<List>(
              future: this.alimentosHoje,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                String objetivo = this.user.objetivo;
                String totalCalorias = this.user.calorias.toString();
                int caloriasConsumidas = 0;
                int caloriasRestantes = this.user.calorias;
                if(snapshot.hasData) {
                  List<Alimento> alimentos = snapshot.data;
                  alimentos.forEach((alimento) {
                    caloriasConsumidas += alimento.calorias;
                  });
                  caloriasRestantes -= caloriasConsumidas;
                  return diarioView(objetivo, totalCalorias, caloriasConsumidas.toString(), caloriasRestantes.toString());
                }
                return diarioView(objetivo, totalCalorias, caloriasConsumidas.toString(), caloriasRestantes.toString());
              }
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: SimpleRoundButton(
                backgroundColor: Colors.green,
                buttonText: Text(
                  "+ Consumo",
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onPressed: () => _toListaAlimentosView(),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 30),
              child: SimpleRoundButton(
                backgroundColor: SECONDARY_THEME_COLOR,
                buttonText: Text(
                  "Alimentos Consumidos",
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onPressed: () => _toListaAlimentosHojeView(),
              ),
            ),
          ],
        )
      ),
    );
  }
}

