import 'package:flutter/material.dart';

class SegundoForm {
  var radioValue = 1;
  var checkboxValueCafe = false;
  var checkboxValueAlmoco = false;
  var checkboxValueLanche = false;
  var checkboxValueJantar = false;
  var switchValue = false;
  
  /*doSomething() {
    print("Radio: $radioValue");
    print("CheckBox: $checkboxValueCafe");
    print("CheckBox: $checkboxValueAlmoco");
    print("CheckBox: $checkboxValueLanche");
    print("CheckBox: $checkboxValueJantar");
    print("Switch: $switchValue");
  }*/
}

class SegundoFormWidget extends StatefulWidget {
  final SegundoForm otherData = new SegundoForm();

  @override 
  State<StatefulWidget> createState() {
    return _SegundoFormWidgetState(otherData);
      }
    }
    
  class _SegundoFormWidgetState extends State<SegundoFormWidget>{
    GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    final SegundoForm otherData;

    _SegundoFormWidgetState(this.otherData);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
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
              Column(
                children: [
                  Text('\nQuais refeições você faz durante o dia?'),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool inValue) {
                        setState(() {
                          otherData.checkboxValueCafe = inValue;
                        });
                        },
                        value: otherData.checkboxValueCafe,
                      ),
                      Text('Café da manhã'),
                    ],
                  ),   
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool inValue) {
                        setState(() {
                          otherData.checkboxValueAlmoco = inValue;
                        });
                        },
                        value: otherData.checkboxValueAlmoco,
                      ),
                      Text('Almoço'),
                    ],
                  ),   
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool inValue) {
                        setState(() {
                          otherData.checkboxValueLanche = inValue;
                        });
                        },
                        value: otherData.checkboxValueLanche,
                      ),
                      Text('Lanche da tarde'),
                    ],
                  ), 
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool inValue) {
                        setState(() {
                          otherData.checkboxValueJantar = inValue;
                        });
                        },
                        value: otherData.checkboxValueJantar,
                      ),
                      Text('Jantar'),
                    ],
                  ),   
                ],
              ),
             Row(children: [
                Text('Você deseja receber notificações?'),
                Switch(
                onChanged: (bool value) {
                  setState(() {
                    otherData.switchValue = value;
                  });
                },
                value: otherData.switchValue,
              ),
              ],
              ),
              FlatButton(
                child: Text("Salvar"),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: () {
                  print("Clicou no Botão");
                },
              ),
            ]
          )
        )
    );
  }
  }
              
        