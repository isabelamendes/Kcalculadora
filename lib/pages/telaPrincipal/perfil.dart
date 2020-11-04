import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:kcalculadora/utils/constantes.dart';

import '../../components/views.dart';

void _salvarConfig(BuildContext context) {
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
  }


class Perfil extends StatefulWidget {
  User user = new User();

  Perfil(User user) {
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
  User user;

  _MyPerfil(User user) {
    this.user = user;
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
                                  child: TextField(
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '2000',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
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
                                  user.notificacoes = value;
                                });
                              },
                              value: user.notificacoes,
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
                                    _salvarConfig(context);
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
                          
    
    
    /*Form(
      key: formKey;
      child: Column(
        children: [
          Column(
                children: [
                  Text('Qual seu objetivo?'), 
               ]  
          ),
          Row(
            children: [
              Radio(
                value: 1,
                onChanged: (int inValue) {
                  setState(() {
                    otherData.radioValue = inValue;
                  });
                },
                groupValue: otherData.radioValue,
              ),
              Text("Perder peso"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                onChanged: (int inValue) {
                  setState(() {
                    otherData.radioValue = inValue;
                  });
                },
                groupValue: otherData.radioValue,
              ),
              Text("Ganhar peso"),
            ],
          ),
          Row(
            children: [
                Radio(
                value: 3,
                onChanged: (int inValue) {
                  setState(() {
                    otherData.radioValue = inValue;
                  });
                },
                groupValue: otherData.radioValue,
              ),
              Text("Manter peso"),
            ],
          ),
          
            SimpleRoundButton(
              backgroundColor: PRIMARY_THEME_COLOR,
              buttonText: Text(
                "Botao",
                style: TextStyle(
                  color: Colors.white
                  )
              ),
              onPressed: () {
                
              }
              ),
        ]
      ),
    );
  }
}*/
