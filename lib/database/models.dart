class UserKcal {
  String uid;
  String uidCredential;
  String email = "";
  String password = "";
  int calorias = 2000;
  String objetivo = "Perder Peso";
  bool notificacoes = false;

  UserKcal();

  UserKcal.fromMap(map) {
    this.uid = map["id"];
    this.email = map["email"];
    this.password = map["password"];
  }

  setEmail(email) {
    this.email = email;
  }

  setPassword(password) {
    this.password = password;
  }

  setcalorias(calorias) {
    this.calorias = calorias;
  }

  setobjetivo(objetivo) {
    this.objetivo = objetivo;
  }

  setnotificacoes(notificacoes) {
    this.notificacoes = notificacoes;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["email"] = this.email;
    map["calorias"] = this.calorias;
    map["objetivo"] = this.objetivo;
    map["notificacoes"] = this.notificacoes;
    return map;
  }

}

class Alimento {
  String calorias = "";
}