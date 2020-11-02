import 'package:flutter/material.dart';
import 'database/models.dart';
import 'views.dart';

class MyFirstBottomNavigationBar extends StatefulWidget {
  User user = new User();

  MyFirstBottomNavigationBar(User user) {
    this.user = user;
  }

  @override
  State<StatefulWidget> createState() {
    return new _MyBottomNavigationBar(this.user);
  }
}

class _MyBottomNavigationBar extends State<MyFirstBottomNavigationBar> {
  User user = new User();
  int _currentPage = 0;
  var _pages;
  
  _MyBottomNavigationBar (User user) {
    this.user = user;
  }

  @override
  void initState() {
    super.initState();

    _currentPage = 0;
    _pages = [
      //Container(child: Text("Page 1 - Biografia Isabela")),
      generateTelaPrincipal(this.user),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Gerenciador de Layout",
        theme: ThemeData(
        
        primaryColor: Color(0xFF44789B),
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        home: Scaffold(
            body: Center(child: _pages.elementAt(_currentPage)),
            appBar: AppBar(title: Text("Kcalculadora")),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.face), title: Text("Meu dia")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.tag_faces), title: Text("Meu histórico")),
                /*BottomNavigationBarItem(
                    icon: Icon(Icons.book), title: Text("Formulários"))*/
              ],
              fixedColor: Colors.purple,
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
    /*return ListView(
      children: [
        DrawerHeader(
          child: Text("Menu"),
          decoration: BoxDecoration(color: Colors.purple),
        ),
        ListTile(
            leading: Icon(Icons.gif),
            title: Text("Cadastrar novo alimento"),
            onTap: () {
              print("TEM QUE LEVAR PRA PAGINA DE CADASTRO DOS ALIMENTOS");  // TERMINAR ISSO
              Navigator.pop(context);
            }),
        ListTile(
          leading: Icon(Icons.book),
          title: Text("Lista de alimentos cadastrados"),
          onTap: () {
            print("TEM QUE LEVAR PRA LISTA DE ALIMENTOS"); // TERMINAR ISSO
            Navigator.pop(context);
          }
        ),
      ],
    );
  }*/
}



