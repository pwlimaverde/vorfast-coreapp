import 'package:cloud_firestore/cloud_firestore.dart';
//Importes Internos
import 'interfaces/produtos_repository_interface.dart';
import '../../categorias/model/categorias_model.dart';
import '../model/produtos_model.dart';

class ProdutosRepository implements IProdutosRepository {
  final Firestore firestore;

  ProdutosRepository(this.firestore);

  @override
  Stream<List<ProdutosModel>> getProdCateg({CategoriasModel categoria}) {
    return firestore
        .collection("categorias")
        .document(categoria.id)
        .collection("produtos")
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return ProdutosModel.fromDocument(doc: doc, categoriaBase: categoria.id);
      }).toList();
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
