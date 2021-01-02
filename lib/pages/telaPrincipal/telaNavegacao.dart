import 'package:flutter/material.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/pages/telaPrincipal/diario.dart';
import 'package:kcalculadora/pages/telaPrincipal/historico.dart';
import 'package:kcalculadora/pages/telaPrincipal/perfil.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class TelaNavegacao extends StatefulWidget {
  UserKcal user;

  TelaNavegacao(UserKcal user) {
    this.user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyTelaNavegacao(this.user);
  }
}

class _MyTelaNavegacao extends State<TelaNavegacao> {
  UserKcal user;
  int _currentPage = 0;
  var _pages;
  
  
  var _context;

  _MyTelaNavegacao(UserKcal user) {
    this.user = user;
  }

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pages = [
      Diario(this.user),
      Historico(this.user),
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
        appBar: AppBar(
          title: Text("Kcalculadora"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.calendarDay), title: Text("Diário"),
            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.history), title: Text("Histórico")
            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user), title: Text("Perfil")
            ),
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



