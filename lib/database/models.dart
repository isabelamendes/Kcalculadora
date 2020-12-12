
class User {
  int id;
  String email = "";
  String password = "";
  int calorias = 2000;  //texformfields
  String objetivo = "Perder Peso"; //radiobutton
  bool notificacoes = false;  //switch

  User();

  User.fromMap(map) {
    this.id = map["id"];
    this.email = map["email"];
    this.password = map["password"];
  }

  setEmail(email){
    this.email = email;
  }
  setPassword(password){
    this.password = password;
  }

  isValidUser() {
    return true;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["email"] = this.email;
    map["password"] = this.password;
    return map;
  }



}

class Alimento {
  String calorias = "";
}