import 'package:flutter/material.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/views.dart';
import 'package:kcalculadora/database/alimento_reference.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:kcalculadora/utils/helpers.dart';


class NovoAlimento extends StatefulWidget {
  @override
  _NovoAlimentoState createState() => new _NovoAlimentoState();
}

class _NovoAlimentoState extends State<NovoAlimento> {

  var _context;
  String nomeAlimento;
  int caloriasAlimento;
  final formKey = GlobalKey<FormState>();

  void _adicionarAlimento(BuildContext context) {
    final scaffold = Scaffold.of(context);
    Alimento alimento = new Alimento();
    alimento.nome = this.nomeAlimento;
    alimento.calorias = this.caloriasAlimento;
    try {
      AlimentoReference alimentoReference = new AlimentoReference();
      alimentoReference.createAlimento(alimento);
      scaffold.showSnackBar(
        SnackBar(
          content: Text('Alimento cadastrado!'),
        ),
      );
    } catch(e) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text('Problemas ao cadastrar alimento!'),
        ),
      );
    }
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
        title: Text("Novo Alimento"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            // minHeight: viewportConstraints.maxHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: secondaryBackgroundView(),
                height: MediaQuery.of(context).size.height,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(30.0),
                          ),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: new Text(
                                    "Nome do Alimento",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: PRIMARY_THEME_COLOR,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: PRIMARY_THEME_COLOR,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Banana',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    validator: (String inValue) {
                                      if (inValue.isEmpty) {
                                        return "Digite o nome do alimento";
                                      }
                                    },
                                    onSaved: (String inValue) {
                                      this.nomeAlimento = inValue;
                                    }
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                          ),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: new Text(
                                    "Quantidade de Kcal",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: PRIMARY_THEME_COLOR,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: PRIMARY_THEME_COLOR,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '100',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    validator: (String inValue) {
                                      if (inValue.isEmpty) {
                                        return "Digite a quantidade de Kcal";
                                      }
                                      
                                      if (!isNumeric(inValue)) {
                                        return "Digite somente números";
                                      }
                                    },
                                    onSaved: (String inValue) {
                                      this.caloriasAlimento = int.parse(inValue);
                                    }
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) =>
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                              child: Column(
                                children: [
                                  SimpleRoundButton(
                                    backgroundColor: PRIMARY_THEME_COLOR,
                                    buttonText: Text(
                                    "Adicionar",
                                    style: TextStyle(
                                    color: Colors.white
                                    )
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState.validate()) {
                                        formKey.currentState.save();
                                        _adicionarAlimento(context);
                                      }
                                    }              
                                  ),
                                ],
                              ),
                            )
                          )
                        ] 
                      ),
                    ],
                  )
                ),
              )
            ]
          )
        )
      )
    );
  }
}
