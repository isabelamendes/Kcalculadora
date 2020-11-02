import 'package:flutter/material.dart';
import 'package:kcalculadora/pages/login/login_teste.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //primaryColor: Color(0xFFD9A813),
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

