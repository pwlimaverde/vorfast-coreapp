import '../../../../shared/theme/model/theme_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import '../../model/secao_model.dart';

abstract class IHomeRepository implements Disposable {
  Stream<List<SecaoModel>> getAllSecao();
  Future<ThemeModel> getThemeConfig();
  Future<void> saveCor({
    String keyR,
    int corR,
    String keyG,
    int corG,
    String keyB,
    int corB,
    FirebaseUser user,
  });
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
  });
  Future<void> saveImgGalery({SecaoModel secao});
  Future<void> saveImgLink({SecaoModel secao, String link});
}
