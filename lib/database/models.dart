import 'package:flutter/material.dart';

class User {
  String username = "";
  String password = "";
  String email = "";
  int calorias = 5000;  //texformfields
  String objetivo = ""; //radiobutton
  bool notificacoes = false;  //switch

  isValidUser() {
    return true;
  }
}

class Alimento {
  String calorias = "";
}