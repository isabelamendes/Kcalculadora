import 'package:flutter/material.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/alimento/alimento.dart';
import 'package:kcalculadora/pages/login/login.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:kcalculadora/pages/telaPrincipal/diario.dart';
import 'package:kcalculadora/components/views.dart';

class ListaAlimentos extends StatefulWidget {
  @override
  _ListaAlimentosState createState() => new _ListaAlimentosState();
}

class _ListaAlimentosState extends State<ListaAlimentos> {

  final Alimento alimento = new Alimento();

  void _adicionarAlimento(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('Alimento adicionado com sucesso!'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: PageView(
                  physics: new AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        AlimentoView(
                          nome: Text('Banana'),
                          calorias: Text('90Kcal'),
                        ),
                        AlimentoView(
                          nome: Text('Banana'),
                          calorias: Text('90Kcal'),
                        ),
                        AlimentoView(
                          nome: Text('Banana'),
                          calorias: Text('90Kcal'),
                        ),
                        SimpleRoundButton(
                          backgroundColor: PRIMARY_THEME_COLOR,
                          buttonText: Text(
                            "Voltar",
                            style: TextStyle(
                              color: Colors.white
                              )
                          ),
                          onPressed: () => () {}
                        ),
                      ],
                    )
                  ],
                  scrollDirection: Axis.horizontal,
                )
              )
            )
          ])
      )
    )
    );
  }
}
