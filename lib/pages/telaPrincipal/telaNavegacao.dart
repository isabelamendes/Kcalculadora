import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/pages/telaPrincipal/diario.dart';
import 'package:kcalculadora/pages/telaPrincipal/meuConsumo.dart';
import 'package:kcalculadora/pages/telaPrincipal/perfil.dart';
import 'package:kcalculadora/utils/constantes.dart';


class TelaNavegacao extends StatefulWidget {
  User user;

  TelaNavegacao(User user) {
    this.user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyTelaNavegacao(this.user);
  }
}

class _MyTelaNavegacao extends State<TelaNavegacao> {
  User user;
  int _currentPage = 0;
  var _pages;
  
  var _context;

  _MyTelaNavegacao(User user) {
    this.user = user;
  }

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pages = [
      Diario(this.user),
      Consumo(this.user),
      Perfil(this.user),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return MaterialApp(
      title: "Gerenciador de Layout",
      theme: ThemeData(
        primaryColor: PRIMARY_THEME_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(child: _pages.elementAt(_currentPage)),
        appBar: AppBar(title: Text("Kcalculadora")),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.today), label: "Diário"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined), label: "Histórico"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: "Perfil"),
          ],
          fixedColor: PRIMARY_THEME_COLOR,
          currentIndex: _currentPage,
          onTap: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        )
      )
    );         
  }
}



