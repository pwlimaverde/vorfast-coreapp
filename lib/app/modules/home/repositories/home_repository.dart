import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coreapp/app/modules/home/model/secao_model.dart';
import 'package:coreapp/app/shared/theme/model/theme_model.dart';
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
        return SecaoModel.fromDocument(doc, _getPromo(doc.reference));
      }).toList();
    });
  }

  Stream<List<PromoModel>> _getPromo(DocumentReference doc) {
    return doc.collection("anuncios").snapshots().map((query) {
      return query.documents.map((doc) {
        return PromoModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future<void> saveCor({
    String keyR,
    int corR,
    String keyG,
    int corG,
    String keyB,
    int corB,
    FirebaseUser user,
  }) async {
    try {
      await firestore.collection("settingstheme").document("theme").updateData({
        '$keyR': corR,
        '$keyG': corG,
        '$keyB': corB,
        'user': user.uid,
      });
    } catch (e) {}
  }

  @override
  Future<void> saveCorHeader({
    String doc,
    String keyR,
    int corR,
    String keyG,
    int corG,
    String keyB,
    int corB,
    String keyO,
    int corO,
    FirebaseUser user,
  }) async {
    try {
      await firestore.collection("secao").document(doc).updateData({
        '$keyR': corR,
        '$keyG': corG,
        '$keyB': corB,
        '$keyO': corO,
        'user': user.uid,
      });
    } catch (e) {}
  }

  @override
  Future<ThemeModel> getThemeConfig() {
    return firestore
        .collection("settingstheme")
        .document("theme")
        .get()
        .then((event) {
      return ThemeModel.fromDocument(event);
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
