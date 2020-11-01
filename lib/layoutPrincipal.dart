import 'package:atividade01/components/forms.dart';
import 'package:flutter/material.dart';
import 'views.dart';

class MyFirstBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyBottomNavigationBar();
  }
}

class _MyBottomNavigationBar extends State<MyFirstBottomNavigationBar> {
  int _currentPage = 0;
  var _pages;
  
  @override
  void initState() {
    super.initState();

    _currentPage = 0;
    _pages = [
      //Container(child: Text("Page 1 - Biografia Isabela")),
      generateTelaPrincipal(),

      //Text("Page 2 - Biografia Larissa"),
      //generateLarissaView(),

      //Text("Page 3 - Formulários")
      //FormNovoAlimento(),
      //,
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
            /*bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.face), title: Text("Isabela")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.tag_faces), title: Text("Larissa")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book), title: Text("Formulários"))
              ],
              fixedColor: Colors.purple,
              currentIndex: _currentPage,
              onTap: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            )*/
            drawer: Drawer(
          child: mySecondListView(),
        ) 
        )
    );
               
  }
  Widget mySecondListView() {
    return ListView(
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
  }
}



