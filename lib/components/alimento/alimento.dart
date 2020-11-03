import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlimentoView extends StatelessWidget {

  final Text nome;
  final Text calorias;

  const AlimentoView({
    this.nome,
    this.calorias,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.cake),
      title: nome,
      trailing: FaIcon(FontAwesomeIcons.plus),
      onTap: () {
        
      },
      
    );
  }
}
