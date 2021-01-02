class UserKcal {
  String uid;
  String uidCredential;
  int calorias = 2000;
  String objetivo = "Perder peso";
  bool notificacoes = false;

  UserKcal();

  UserKcal.fromMap(map) {
    this.uid = map["uid"];
    this.uidCredential = map["uidCredential"];
    this.calorias = map["calorias"];
    this.objetivo = map["objetivo"];
    this.notificacoes = map["notificacoes"];
  }

  setCalorias(calorias) {
    this.calorias = calorias;
  }

  setObjetivo(objetivo) {
    this.objetivo = objetivo;
  }

  setNotificacoes(notificacoes) {
    this.notificacoes = notificacoes;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["uidCredential"] = this.uidCredential;
    map["calorias"] = this.calorias;
    map["objetivo"] = this.objetivo;
    map["notificacoes"] = this.notificacoes;
    return map;
  }

}

class Alimento {
  String uid;
  String nome = "";
  int calorias = 0;

  Alimento();

  Alimento.fromMap(map) {
    this.uid = map["uid"];
    this.nome = map["nome"];
    this.calorias = map["calorias"];
  }

  setNome(nome) {
    this.nome = nome;
  }

  setCalorias(calorias) {
    this.calorias = calorias;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["calorias"] = this.calorias;
    map["nome"] = this.nome;
    return map;
  }
}

class DiarioUser {
  String uid;
  String userUid;
  String alimentoUid;
  DateTime data;

  DiarioUser();

  DiarioUser.fromMap(map) {
    this.userUid = map["userUid"];
    this.alimentoUid = map["alimentoUid"];
    this.data = map["data"].toDate();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["userUid"] = this.userUid;
    map["alimentoUid"] = this.alimentoUid;
    map["data"] = this.data;
    return map;
  }
}