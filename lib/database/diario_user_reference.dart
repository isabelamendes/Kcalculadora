import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:kcalculadora/database/models.dart';
import 'package:kcalculadora/utils/helpers.dart';

class DiarioUserReference {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('Diario');
  CollectionReference collectionReferenceAlimento = FirebaseFirestore.instance.collection('Alimento');

  getAllDiarios() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<DiarioUser> diarios = new List<DiarioUser>();
    for(var document in querySnapshot.docs) {
      Map<String, dynamic> map = new Map<String, dynamic>();
      map["uid"] = document.id;
      map["userUid"] = document.data()['userUid'];
      map["alimentoUid"] = document.data()['alimentoUid'];
      map["data"] = document.data()['data'];
      diarios.add(new DiarioUser.fromMap(map));
    }
    return diarios;
  }

  getAllAlimentosDiarioByUser(UserKcal user) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    QuerySnapshot querySnapshotAlimento = await collectionReferenceAlimento.get();
    List<Alimento> alimentos = new List<Alimento>();
    for(var document in querySnapshot.docs) {
      if (dateIsToday(document.data()['data'].toDate())) {
        if(document.data()['userUid'] == user.uid) {
          for(var documentAlimento in querySnapshotAlimento.docs) {
            if(documentAlimento.id == document.data()['alimentoUid']) {
              Map<String, dynamic> map = new Map<String, dynamic>();
              map["uid"] = documentAlimento.id;
              map["calorias"] = documentAlimento.data()['calorias'];
              map["nome"] = documentAlimento.data()['nome'];
              alimentos.add(new Alimento.fromMap(map));
            }
          }
        }
      }
    }
    return alimentos;
  }

  getAllDiariosByUser(UserKcal user) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<DiarioUser> diarios = new List<DiarioUser>();
    for(var document in querySnapshot.docs) {
      if(document.data()['userUid'] == user.uid) {
        Map<String, dynamic> map = new Map<String, dynamic>();
        map["uid"] = document.id;
        map["userUid"] = document.data()['userUid'];
        map["alimentoUid"] = document.data()['alimentoUid'];
        map["data"] = document.data()['data'];
        diarios.add(new DiarioUser.fromMap(map));
      }
    }
    return diarios;
  }

  getAllDatesDiariosByUser(UserKcal user) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<DateTime> datas = new List<DateTime>();
    for(var document in querySnapshot.docs) {
      if(document.data()['userUid'] == user.uid) {
        datas.add(document.data()['data'].toDate());
      }
    }
    return datas;
  }

  getAllAlimentosByDataAndUser(UserKcal user, DateTime date) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    QuerySnapshot querySnapshotAlimento = await collectionReferenceAlimento.get();
    List<Alimento> alimentos = new List<Alimento>();
    for(var document in querySnapshot.docs) {
      if (isSameDay(document.data()['data'].toDate(), date)) {
        if(document.data()['userUid'] == user.uid) {
          for(var documentAlimento in querySnapshotAlimento.docs) {
            if(documentAlimento.id == document.data()['alimentoUid']) {
              Map<String, dynamic> map = new Map<String, dynamic>();
              map["uid"] = documentAlimento.id;
              map["calorias"] = documentAlimento.data()['calorias'];
              map["nome"] = documentAlimento.data()['nome'];
              alimentos.add(new Alimento.fromMap(map));
            }
          }
        }
      }
    }
    return alimentos;
  }

  getDiarioByUid(String uid) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.id == uid) {
        Map<String, dynamic> map = new Map<String, dynamic>();
        map["uid"] = document.id;
        map["userUid"] = document.data()['userUid'];
        map["alimentoUid"] = document.data()['alimentoUid'];
        map["data"] = document.data()['data'];
        return new DiarioUser.fromMap(map);
      }
    }
  }

  createDiario(DiarioUser diarioUser) {
    collectionReference.add(diarioUser.toMap());
  }

  deleteDiario(DiarioUser diarioUser) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      String dataHoje = DateFormat('yyyy-MM-dd').format(DateTime.now());
      String dataDocument = DateFormat('yyyy-MM-dd').format(document.data()['data'].toDate());
      String userUidDocument = document.data()['userUid'];
      String alimentoUidDocument = document.data()['alimentoUid'];
      if(dataHoje == dataDocument && userUidDocument == diarioUser.userUid && alimentoUidDocument == diarioUser.alimentoUid) {
        document.reference.delete();
        break;
      }
    }
  }

  deleteDiarioByUid(String uid) async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for(var document in querySnapshot.docs) {
      if(document.id == uid) {
        document.reference.delete();
      }
    }
  }
}