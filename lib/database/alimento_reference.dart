import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kcalculadora/database/models.dart';

class AlimentoReference {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('Alimento');

  getAllAlimentos() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<Alimento> alimentos = new List<Alimento>();
    for(var document in querySnapshot.docs) {
      Map<String, dynamic> map = new Map<String, dynamic>();
      map["uid"] = document.id;
      map["calorias"] = document.data()['calorias'];
      map["nome"] = document.data()['nome'];
      alimentos.add(new Alimento.fromMap(map));
    }
    return alimentos;
  }

  getAlimentoByUid(String uid) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.id == uid) {
        Map<String, dynamic> map = new Map<String, dynamic>();
        map["uid"] = document.id;
        map["calorias"] = document.data()['calorias'];
        map["nome"] = document.data()['nome'];
        return new Alimento.fromMap(map);
      }
    }
  }

  createAlimento(Alimento alimento) {
    collectionReference.add(alimento.toMap());
  }

  deleteAlimento(Alimento alimento) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.id == alimento.uid) {
        document.reference.delete();
      }
    }
  }
}