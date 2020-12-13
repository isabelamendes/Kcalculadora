import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/views.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kcalculadora/database/alimento_reference.dart';
import 'package:kcalculadora/pages/alimentos/novoAlimento.dart';


class ListaAlimentos extends StatefulWidget {
  @override
  _ListaAlimentosState createState() => new _ListaAlimentosState();
}

class _ListaAlimentosState extends State<ListaAlimentos> {

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
          return NovoAlimento();
        })
      );
    });
  }

  void adicionarAlimentoDiario(Alimento alimento, BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(alimento.nome + ' adicionado(a) ao diário!'),
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
    this.alimentos = getListAlimentos();
    super.initState();
  }
  
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
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
          decoration: secondaryBackgroundView(),
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List>(
            future: this.alimentos,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if(snapshot.hasData) {
                List<Alimento> alimentos = snapshot.data;
                List<ListTile> tiles = new List<ListTile>();
                alimentos.forEach((alimento) {
                  tiles.add(ListTile(
                    title: Text(alimento.nome),
                    isThreeLine: true,
                    subtitle: Text(alimento.calorias.toString() + ' Kcal'),
                    leading: Icon(Icons.label),
                    trailing: Builder(
                      builder: (context) => 
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.plusSquare),
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
              return Text('Nenhum alimento cadastrado.'); 
            }
          )
        )
      )
    );
  }
}
