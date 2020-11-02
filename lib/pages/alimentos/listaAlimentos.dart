import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/alimento/alimento.dart';

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
        content: Text('Usuário registrado com sucesso!'),
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
                        )
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
