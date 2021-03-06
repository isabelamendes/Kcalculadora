import 'package:flutter/material.dart';
import 'package:kcalculadora/database/diario_user_reference.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/views.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kcalculadora/pages/telaPrincipal/telaNavegacao.dart';
import 'package:kcalculadora/utils/constantes.dart';

class ListaAlimentosDiario extends StatefulWidget {
  UserKcal user;

  ListaAlimentosDiario(UserKcal user) {
    this.user = user;
  }

  @override
  _ListaAlimentosDiarioState createState() => new _ListaAlimentosDiarioState(this.user);
}

class _ListaAlimentosDiarioState extends State<ListaAlimentosDiario> {

  UserKcal user;

  _ListaAlimentosDiarioState(UserKcal user) {
    this.user = user;
  }
  
  var _context;
  final Alimento alimento = new Alimento();

  Future<List<Alimento>> alimentosHoje;

  Future<List<Alimento>> getListAlimentosHoje() async {
    DiarioUserReference diarioReference = new DiarioUserReference();
    List<Alimento> alimentosHoje = await diarioReference.getAllAlimentosByDataAndUser(user, new DateTime.now());
    return alimentosHoje;
  }

  void removerAlimentoDiario(Alimento alimento, BuildContext context) {
    DiarioUser diarioUser = new DiarioUser();
    diarioUser.data = new DateTime.now();
    diarioUser.userUid = this.user.uid;
    diarioUser.alimentoUid = alimento.uid;

    final scaffold = Scaffold.of(context);
    try {
      DiarioUserReference diarioUserReference = new DiarioUserReference();
      diarioUserReference.deleteDiario(diarioUser);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(alimento.nome + ' removido(a) do diário!'),
        ),
      );
    } catch(e) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text('Problemas ao remover alimento!'),
        ),
      );
    }
  }

  @override
  void initState() {
    this.alimentosHoje = getListAlimentosHoje();
    super.initState();
  }
  
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            setState((){
              Navigator.push(_context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                  return TelaNavegacao(user);
                })
              );
            })
          },
        ), 
        title: Text("Alimentos Consumidos Hoje"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List>(
            future: this.alimentosHoje,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return simpleLoaderView();
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  else {
                    List<Alimento> alimentos = snapshot.data;
                    List<ListTile> tiles = new List<ListTile>();
                    alimentos.forEach((alimento) {
                      String imagemKcal;
                      if(alimento.calorias < 100) {
                        imagemKcal = PATH_LOW_KCAL;
                      } else if (alimento.calorias >= 100 && alimento.calorias <= 200) {
                        imagemKcal = PATH_MED_KCAL;
                      } else {
                        imagemKcal = PATH_HIGH_KCAL;
                      }
                      tiles.add(ListTile(
                        leading: Container(
                          margin: const EdgeInsets.only(top:10, bottom: 5),
                          child : ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 44,
                              minHeight: 44,
                              maxWidth: 64,
                              maxHeight: 64,
                            ),
                            child: Image.asset(imagemKcal, fit: BoxFit.cover),
                          ),
                        ),
                        title: Container(
                          margin: const EdgeInsets.only(top:10, bottom: 5),
                          child : Text(alimento.nome),
                        ),
                        isThreeLine: true,
                        subtitle: Text(alimento.calorias.toString() + ' Kcal'),
                        trailing: Builder(
                          builder: (context) => 
                          IconButton(
                            color: Colors.red,
                            icon: FaIcon(FontAwesomeIcons.timesCircle),
                            tooltip: 'Remover Alimento',
                            onPressed: () => removerAlimentoDiario(alimento, context),
                          ),
                        )
                      ));
                    });
                    return PageView(
                      physics: new AlwaysScrollableScrollPhysics(),
                      children: <Widget>[
                        ListView(
                          children: tiles
                        )
                      ],
                      scrollDirection: Axis.horizontal,
                    );
                  }
              }
            }
          )
        )
      )
    );
  }
}
