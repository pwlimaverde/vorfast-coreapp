import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import '../../model/categorias_model.dart';

abstract class ICategoriasRepository implements Disposable {
  Future<List<CategoriasModel>> getAllCategorias();
}
