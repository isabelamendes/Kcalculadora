import 'package:flutter/material.dart';
import 'package:kcalculadora/database/diario_user_reference.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/views.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kcalculadora/database/alimento_reference.dart';
import 'package:kcalculadora/pages/alimentos/novoAlimento.dart';
import 'package:kcalculadora/pages/telaPrincipal/telaNavegacao.dart';
import 'package:kcalculadora/utils/constantes.dart';


class ListaAlimentos extends StatefulWidget {
  UserKcal user;

  ListaAlimentos(UserKcal user) {
    this.user = user;
  }

  @override
  _ListaAlimentosState createState() => new _ListaAlimentosState(this.user);
}

class _ListaAlimentosState extends State<ListaAlimentos> {

  UserKcal user;

  _ListaAlimentosState(UserKcal user) {
    this.user = user;
  }
  
  var _context;
  final Alimento alimento = new Alimento();

  Future<List<Alimento>> alimentos;

  Future<List<Alimento>> getListAlimentos() async {
    AlimentoReference alimentoReference = new AlimentoReference();
    List<Alimento> alimentos = await alimentoReference.getAllAlimentos();
    return alimentos;
  }

  void _adicionarNovoAlimento(BuildContext context) {
    setState((){
      Navigator.push(_context,
        MaterialPageRoute(
          builder: (BuildContext context) {
          return NovoAlimento(this.user);
        })
      );
    });
  }

  void adicionarAlimentoDiario(Alimento alimento, BuildContext context) {
    DiarioUser diarioUser = new DiarioUser();
    diarioUser.data = new DateTime.now();
    diarioUser.userUid = this.user.uid;
    diarioUser.alimentoUid = alimento.uid;

    final scaffold = Scaffold.of(context);
    try {
      DiarioUserReference diarioUserReference = new DiarioUserReference();
      diarioUserReference.createDiario(diarioUser);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(alimento.nome + ' adicionado(a) ao diário!'),
        ),
      );
    } catch (e) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text('Problemas ao adicionar alimento ao diário!'),
        ),
      );
    }
  }

  @override
  void initState() {
    this.alimentos = getListAlimentos();
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
        title: Text("Lista de Alimentos"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.plus),
            onPressed: () {
              _adicionarNovoAlimento(context);
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List>(
            future: this.alimentos,
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
                            color: Colors.green,
                            icon: FaIcon(FontAwesomeIcons.plusCircle),
                            tooltip: 'Adicionar Alimento',
                            onPressed: () => adicionarAlimentoDiario(alimento, context),
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
