import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import '../../model/promo_model.dart';

abstract class IHomeRepository implements Disposable {
  Stream<List<PromoModel>> getAllPromo();
}
