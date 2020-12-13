import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:kcalculadora/database/user_reference.dart';
import '../../components/views.dart';
import 'package:kcalculadora/utils/helpers.dart';

void _salvarConfig(BuildContext context, UserKcal user) async {
  try {
    await new UserReference().updateUser(user);
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('Configurações de usuário salvas com sucesso!'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
          },
        ),
      ),
    );
  } catch(e) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('Problemas ao atualizar as configurações!'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
          },
        ),
      ),
    );
  }
}


class Perfil extends StatefulWidget {
  UserKcal user;

  Perfil(UserKcal user) {
    this.user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyPerfil(this.user);
  }
}

class _MyPerfil extends State<Perfil> {
  int radioValue = 1;
  var _context;
  UserKcal user;

  _MyPerfil(UserKcal user) {
    this.user = user;
    if (user.objetivo == "Ganhar peso") {
      this.radioValue = 1;
    }
    if (user.objetivo == "Manter peso") {
      this.radioValue = 2;
    }
    if (user.objetivo == "Perder peso") {
      this.radioValue = 3;
    }
  }

  final formKey = GlobalKey<FormState>();
    
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // minHeight: viewportConstraints.maxHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: secondaryBackgroundView(),
              padding: EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: new Text(
                                    "Quantidade de calorias diárias",
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
                            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                      hintText: '2000',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    initialValue: this.user.calorias.toString(),
                                    validator: (String inValue) {
                                      if (inValue.isEmpty) {
                                        return "Digite a quantidade de calorias";
                                      }
                                      if (!isNumeric(inValue)) {
                                        return "Digite somente números";
                                      }
                                    },
                                    onSaved: (String inValue) {
                                      user.setCalorias(int.parse(inValue));
                                    }
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                          Divider(
                            height: 24.0,
                          ),
                          Container (
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Text('Objetivo',
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: PRIMARY_THEME_COLOR,  
                                    ),
                                  )
                                ]),
                                Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      onChanged: (int inValue) {
                                        setState(() {
                                          this.radioValue = inValue;
                                        });
                                        this.user.objetivo = "Ganhar peso";
                                      },
                                      groupValue: this.radioValue ,
                                    ),
                                    Text("Ganhar peso"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      onChanged: (int inValue) {
                                        setState(() {
                                          this.radioValue = inValue;
                                        });
                                        this.user.objetivo = "Manter peso";
                                      },
                                      groupValue: this.radioValue,
                                    ),
                                    Text("Manter peso"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 3,
                                      onChanged: (int inValue) {
                                        setState(() {
                                          this.radioValue = inValue;
                                        });
                                        this.user.objetivo = "Perder peso";
                                      },
                                      groupValue: this.radioValue,
                                    ),
                                    Text("Perder peso"),
                                  ],
                                ),
                              ],
                            ) 
                          ),
                          
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(children: [
                              Text(
                                'Você deseja receber notificações?', 
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: PRIMARY_THEME_COLOR,  
                                ),
                              ),
                              Switch(
                                onChanged: (bool value) {
                                  setState(() {
                                    this.user.notificacoes = value;
                                  });
                                },
                                value: this.user.notificacoes,
                              ),
                            ]),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                            child: Column(
                              children: [
                                SimpleRoundButton(
                                  backgroundColor: SECONDARY_THEME_COLOR,
                                  buttonText: Text(
                                  "Salvar configurações",
                                  style: TextStyle(
                                  color: Colors.white
                                  )
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                      _salvarConfig(context, this.user);
                                    }
                                  }              
                                ),
                              ],
                            ),
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
    );
  }
}
                          