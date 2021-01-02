import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kcalculadora/utils/constantes.dart';

BoxDecoration primaryBackgroundView() {
  return BoxDecoration(
    color: BACKGROUND_THEME_COLOR,
    image: DecorationImage(
      colorFilter: new ColorFilter.mode(
          Colors.black.withOpacity(0.2), BlendMode.dstATop),
      image: AssetImage('assets/images/apple.png'),
      fit: BoxFit.cover,
    ),
  );
}


BoxDecoration secondaryBackgroundView() {
  return BoxDecoration(
    color: Colors.white,
    image: DecorationImage(
      colorFilter: new ColorFilter.mode(
          Colors.black.withOpacity(0.07), BlendMode.dstATop),
      image: AssetImage('assets/images/apple.png'),
      fit: BoxFit.cover,
    ),
  );
}

Widget simpleLoaderView() {
  return GFLoader();
}

Widget iosLoaderView() {
  return GFLoader(
    type:GFLoaderType.ios
  );
}

Widget diarioView(String objetivo, String caloriasTotais, String caloriasConsumidas, String caloriasRestantes) {
  return Expanded(
    child: GridView.count(
      mainAxisSpacing:  10,
      crossAxisSpacing: 10,
      primary: false,
      crossAxisCount: 2,
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(left: 30.0, top: 30.0, right: 10.0, bottom: 30.0),
          elevation: 4,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Objetivo',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  objetivo,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                  ),
                )
              ),
            ],
          )
        ),
        Card(
          margin: EdgeInsets.only(left: 10.0, top: 30.0, right: 30.0, bottom: 30.0),
          elevation: 4,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Limite de Calorias',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  caloriasTotais,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                  ),
                )
              ),
            ],
          )
        ),
        Card(
          margin: EdgeInsets.only(left: 30.0, top: 0.0, right: 10.0, bottom: 60.0),
          elevation: 4,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Total Consumido',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  caloriasConsumidas,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey
                  ),
                )
              ),
            ],
          )
        ),
        Card(
          margin: EdgeInsets.only(left: 10.0, top: 0.0, right: 30.0, bottom: 60.0),
          elevation: 4,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Restantes',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  caloriasRestantes,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),
                )
              ),
            ],
          )
        ),
        
      ],
    )
  );
}

Widget tabelaHistoricoView(rows) {
  return DataTable(
    columns: const <DataColumn>[
      DataColumn(
        label: Text(
          'Dia',
          style: TextStyle(fontWeight: FontWeight.bold) ,
        ),
      ),
      DataColumn(
        label: Text(
          'Calorias',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Meta Alcançada',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ],
    rows: rows,
  );
}