import 'package:flutter/material.dart';

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
      trailing: Icon(Icons.add_circle_outlined),
    );
  }
}
