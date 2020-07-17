import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import '../../model/promo_model.dart';
import '../../model/secao_model.dart';

abstract class IHomeRepository implements Disposable {
  Stream<List<PromoModel>> getAllPromo();
  Stream<List<SecaoModel>> getAllSecao();
  Future<List<PromoModel>> getAnuncios(SecaoModel secao);
  Stream<List<PromoModel>> getPromo(DocumentReference doc);
  Future<void> saveCor({String key, int cor, FirebaseUser user});
}
