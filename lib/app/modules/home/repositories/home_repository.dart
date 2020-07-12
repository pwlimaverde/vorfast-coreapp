import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//Importes Internos
import 'interfaces/home_repository_interface.dart';
import '../model/promo_model.dart';

class HomeRepository implements IHomeRepository {
  final Firestore firestore;

  HomeRepository(this.firestore);

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
