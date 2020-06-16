import 'package:cloud_firestore/cloud_firestore.dart';
//Importes Internos
import 'interfaces/categorias_repository_interface.dart';
import '../model/categorias_model.dart';

class CategoriasRepository implements ICategoriasRepository {
  final Firestore firestore;

  CategoriasRepository(this.firestore);

  @override
  Future<List<CategoriasModel>> getAllCategorias() {
    firestore.collection("categorias").document("camisetas").collection("produtos").document("8nMkl16DnqQezCzGMpS9").get().then((value) => print(value.data));
    return firestore.collection("categorias").getDocuments().then((value) =>
        value.documents.map((e) => CategoriasModel.fromDocument(e)).toList());
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
