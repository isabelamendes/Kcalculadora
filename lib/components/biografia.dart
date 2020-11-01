import 'package:flutter/material.dart';

Widget biografia(nameImage, biografia) {
  return Center(
    child: Column(children: [
      Text('BIOGRAFIA'),
      Image(image: AssetImage(nameImage), height: 300, fit: BoxFit.fitHeight),
      Text(biografia),
    ]),
  );
}




