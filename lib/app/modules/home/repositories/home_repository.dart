import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coreapp/app/modules/home/model/secao_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
//Importes Internos
import 'interfaces/home_repository_interface.dart';
import '../model/promo_model.dart';

class HomeRepository implements IHomeRepository {
  final Firestore firestore;

  HomeRepository(this.firestore);

  @override
  Stream<List<SecaoModel>> getAllSecao() {
    return firestore
        .collection("secao")
        .orderBy("prioridade", descending: true)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        getPromo(doc.reference);
        return SecaoModel.fromDocument(doc, getPromo(doc.reference));
      }).toList();
    });
    // print("vindo da repo - $listT");
    // List<SecaoModel> listOk = [];
    // for (SecaoModel secao in listT) {
    //   secao.anuncios = await _getAnuncios(secao.reference);
    //   listOk.add(secao);
    // }
  }

  Stream<List<PromoModel>> getPromo(DocumentReference doc) {
    return doc.collection("anuncios").snapshots().map((query) {
      return query.documents.map((doc) {
        return PromoModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future<List<PromoModel>> getAnuncios(SecaoModel secao) {
    return secao.reference
        .collection("anuncios")
        .orderBy("prioridade")
        .getDocuments()
        .then((query) {
      return query.documents.map((doc) {
        return PromoModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Stream<List<PromoModel>> getAllPromo() {
    try {
      return firestore
          .collection("promocoes")
          .orderBy("prioridade")
          .snapshots()
          .map((query) {
        return query.documents.map((doc) {
          return PromoModel.fromDocument(doc);
        }).toList();
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveCor({String key, int cor, FirebaseUser user}) async {
    try {
      await firestore.collection("settingstheme").document("theme").updateData({
        '$key': cor,
        'user': user.uid,
      });
    } catch (e) {}
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
