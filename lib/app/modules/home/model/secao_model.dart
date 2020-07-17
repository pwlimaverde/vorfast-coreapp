import 'package:cloud_firestore/cloud_firestore.dart';
import 'promo_model.dart';

class SecaoModel {
  DocumentReference reference;
  String nome;
  bool scrow;
  Stream<List<PromoModel>> anuncios;

  SecaoModel({
    this.reference,
    this.nome,
    this.scrow,
    this.anuncios,
  });

  factory SecaoModel.fromDocument(
      DocumentSnapshot doc, Stream<List<PromoModel>> anuncios) {
    return SecaoModel(
      reference: doc.reference,
      nome: doc['nome'],
      scrow: doc['scrow'],
      anuncios: anuncios,
    );
  }

  @override
  String toString() {
    return " seção - $nome - anuncios $anuncios";
  }
}
