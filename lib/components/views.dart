import 'package:flutter/material.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';

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

Widget diarioView() {
  return Expanded(
    child: GridView.count(
      mainAxisSpacing:  10,
      crossAxisSpacing: 10,
      primary: false,
      crossAxisCount: 2,
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(left: 30.0, top: 30.0, right: 10.0),
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
                  'Perder Peso',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          )
        ),
        Card(
          margin: EdgeInsets.only(left: 10.0, top: 30.0, right: 30.0),
          elevation: 4,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Total Permitido',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  '2000 Kcal',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          )
        ),
        Card(
          margin: EdgeInsets.only(left: 30.0, top: 30.0, right: 10.0),
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
                  '760 Kcal',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          )
        ),
        Card(
          margin: EdgeInsets.only(left: 10.0, top: 30.0, right: 30.0),
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
                  '1240 Kcal',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          )
        ),
        
      ],
    )
  );
}
