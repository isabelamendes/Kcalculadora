import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/views.dart';


class ListaAlimentos extends StatefulWidget {
  @override
  _ListaAlimentosState createState() => new _ListaAlimentosState();
}

class _ListaAlimentosState extends State<ListaAlimentos> {

  var _context;
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
    this._context = context;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text("Lista de Alimentos"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: secondaryBackgroundView(),
          height: MediaQuery.of(context).size.height,
          child: PageView(
            physics: new AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              dataTableAlimentosView(context),
            ],
            scrollDirection: Axis.horizontal,
          )
        )
      )
    );
  }
}
