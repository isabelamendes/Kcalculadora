import 'package:flutter/material.dart';
import 'package:kcalculadora/components/views.dart';
import 'package:kcalculadora/database/diario_user_reference.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Historico extends StatefulWidget {
  UserKcal user;

  Historico(UserKcal user) {
    this.user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyHistorico(this.user);
  }
}

class _MyHistorico extends State<Historico> {

  Future<List<Map<String, dynamic>>> rowsHistorico;

  Future<List<Map<String, dynamic>>> getRowsHistorico() async {
    DiarioUserReference diarioUserReference = new DiarioUserReference();
    List<DateTime> datas = await diarioUserReference.getAllDatesDiariosByUser(this.user);
    List<Map<String, dynamic>> rowsHistorico = new List<Map<String, dynamic>>();

    List<String> dias = List<String>();
    datas.forEach((data) {
      String dia = DateFormat('yyyy-MM-dd').format(data);
      if(!dias.contains(dia)) {
        dias.add(dia);
      }
    });
    datas = [];
    dias.forEach((dia) {
      datas.add(DateTime.parse(dia));
    });
    
    for (var data in datas) {
      DiarioUserReference diarioUserReference = new DiarioUserReference();
      
      List<Alimento> alimentos = await diarioUserReference.getAllAlimentosByDataAndUser(user, data);
      int calorias = 0;
      alimentos.forEach((alimento) {
        calorias += alimento.calorias;
      });
      bool metaAlcancada;
      int limiteCalorias = this.user.calorias;
      if (this.user.objetivo == "Ganhar peso") {
        if (calorias > limiteCalorias) {
          metaAlcancada = true;
        } else {
          metaAlcancada = false;
        }
      }
      else {
        if (calorias < limiteCalorias) {
          metaAlcancada = true;
        } else {
          metaAlcancada = false;
        }
      }
      
      Map<String, dynamic> row = new Map<String, dynamic>();
      row['data'] = DateFormat('dd/MM/yyyy').format(data);
      row['calorias'] = calorias.toString();
      row['metaAlcancada'] = metaAlcancada;
      rowsHistorico.add(row);
    }
    return rowsHistorico;
  }

  var _context;
  UserKcal user;

  _MyHistorico(UserKcal user) {
    this.user = user;
  }

  @override
  void initState() {
    this.rowsHistorico = getRowsHistorico();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List>(
            future: this.rowsHistorico,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return simpleLoaderView();
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  else {
                    List<Map<String, dynamic>> datas = snapshot.data;
                    List<DataRow> rows = new List<DataRow>();
                    datas.forEach((data) {
                      rows.add(
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(data['data'])),
                            DataCell(Text(data['calorias'])),
                            DataCell(data['metaAlcancada'] ? FaIcon(FontAwesomeIcons.checkCircle, color:Colors.green) : FaIcon(FontAwesomeIcons.times, color:Colors.red))
                          ],
                        ),
                      );
                    });
                    return PageView(
                      physics: new AlwaysScrollableScrollPhysics(),
                      children: <Widget>[
                        tabelaHistoricoView(rows)
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
  }}