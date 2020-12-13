import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kcalculadora/database/models.dart';

class UserReference {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('UserKcal');

  getUidByUser(UserKcal user) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.data()['email'] == user.email) {
        return document.id;
      }
    }
  }

  createUser(UserKcal user) {
    collectionReference.add(user.toMap());
  }

  readUser(UserKcal user) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.id == user.uid) {
        //TODO
      }
    }
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