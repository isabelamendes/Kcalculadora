import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kcalculadora/pages/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

