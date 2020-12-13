import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kcalculadora/database/models.dart';

class UserReference {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('UserKcal');

  getAllUsers() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<UserKcal> users = new List<UserKcal>();
    for(var document in querySnapshot.docs) {
      Map<String, dynamic> map = new Map<String, dynamic>();
      map["uid"] = document.id;
      map["uidCredential"] = document.data()['uidCredential'];
      map["calorias"] = document.data()['calorias'];
      map["objetivo"] = document.data()['objetivo'];
      map["notificacoes"] = document.data()['notificacoes'];
      users.add(new UserKcal.fromMap(map));
    }
    return users;
  }

  getUserByUidCredential(String uidCredential) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.data()['uidCredential'] == uidCredential) {
        Map<String, dynamic> map = new Map<String, dynamic>();
        map["uid"] = document.id;
        map["uidCredential"] = document.data()['uidCredential'];
        map["calorias"] = document.data()['calorias'];
        map["objetivo"] = document.data()['objetivo'];
        map["notificacoes"] = document.data()['notificacoes'];
        return new UserKcal.fromMap(map);
      }
    }
  }

  createUser(UserKcal user) {
    collectionReference.add(user.toMap());
  }

  updateUser(UserKcal user) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.id == user.uid) {
        document.reference.update({
          "calorias": user.calorias,
          "objetivo": user.objetivo,
          "notificacoes": user.notificacoes
        });
      }
    }
  }

  deleteUser(UserKcal user) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.id == user.uid) {
        document.reference.delete();
      }
    }
  }
}