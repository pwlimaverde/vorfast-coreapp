import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import '../../model/promo_model.dart';

abstract class IHomeRepository implements Disposable {
  Stream<List<PromoModel>> getAllPromo();
  Future<void> saveCor({String key, int cor, FirebaseUser user});
}
