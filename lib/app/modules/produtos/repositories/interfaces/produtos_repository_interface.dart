import 'package:flutter_modular/flutter_modular.dart';
//Importes Internos
import '../../../categorias/model/categorias_model.dart';
import '../../model/produtos_model.dart';

abstract class IProdutosRepository implements Disposable {
  Stream<List<ProdutosModel>> getProdCateg({CategoriasModel categoria});
}
