import 'package:flutter/material.dart';
import 'package:kcalculadora/components/views.dart';
import 'package:kcalculadora/database/models.dart';

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

  var _context;
  UserKcal user;

  _MyHistorico(UserKcal user) {
    this.user = user;
  }
  
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: secondaryBackgroundView(),
          height: MediaQuery.of(context).size.height,
          child: PageView(
            physics: new AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              dataTableHistoricoView(this._context),
            ],
            scrollDirection: Axis.horizontal,
          )
        )
      )
    );
  }}