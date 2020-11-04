import 'package:flutter/material.dart';
import 'package:kcalculadora/utils/constantes.dart';
import 'package:kcalculadora/components/buttons/simple_round_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


BoxDecoration primaryBackgroundView() {
  return BoxDecoration(
    color: SECONDARY_THEME_COLOR,
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

Widget dataTableAlimentosView(BuildContext context) {

  void enviarMensagem(String nomeAlimento, BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(nomeAlimento + ' adicionada ao diário!'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
          },
        ),
      ),
    );
  }

  return ListView(
    children: [
      ListTile(
        title: Text('Banana'),
        isThreeLine: true,
        subtitle: Text('96Kcal'),
        leading: Icon(Icons.label),
        trailing: Builder(
          builder: (context) => 
          IconButton(
            icon: FaIcon(FontAwesomeIcons.plusSquare),
            tooltip: 'Adicionar Alimento',
            onPressed: () => enviarMensagem('Banana', context),
          ),
        )
      ),
      ListTile(
        title: Text('Maça'),
        isThreeLine: true,
        subtitle: Text('54Kcal'),
        leading: Icon(Icons.label),
        trailing: Builder(
          builder: (context) => 
          IconButton(
            icon: FaIcon(FontAwesomeIcons.plusSquare),
            tooltip: 'Adicionar Alimento',
            onPressed: () => enviarMensagem('Maça', context),
          ),
        ),
      ),
      ListTile(
        title: Text('200ml de Leite'),
        isThreeLine: true,
        subtitle: Text('124Kcal'),
        leading: Icon(Icons.label),
        trailing: Builder(
          builder: (context) => 
          IconButton(
            icon: FaIcon(FontAwesomeIcons.plusSquare),
            tooltip: 'Adicionar Alimento',
            onPressed: () => enviarMensagem('200ml de Leite', context),
          ),
        ),
      ),
      ListTile(
        title: Text('200g de Frango'),
        isThreeLine: true,
        subtitle: Text('278Kcal'),
        leading: Icon(Icons.label),
        trailing: Builder(
          builder: (context) => 
          IconButton(
            icon: FaIcon(FontAwesomeIcons.plusSquare),
            tooltip: 'Adicionar Alimento',
            onPressed: () => enviarMensagem('200g de Frango', context),
          ),
        ),
      ),
      ListTile(
        title: Text('200g de Carne'),
        isThreeLine: true,
        subtitle: Text('284Kcal'),
        leading: Icon(Icons.label),
        trailing: Builder(
          builder: (context) => 
          IconButton(
            icon: FaIcon(FontAwesomeIcons.plusSquare),
            tooltip: 'Adicionar Alimento',
            onPressed: () => enviarMensagem('200g de Carne', context),
          ),
        ),
      ),
      
    ],
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
