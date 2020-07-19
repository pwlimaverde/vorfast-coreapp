import 'package:cloud_firestore/cloud_firestore.dart';
import 'promo_model.dart';

class SecaoModel {
  DocumentReference reference;
  String nome;
  String img;
  bool scrow;
  int corR;
  int corG;
  int corB;
  int corO;
  Stream<List<PromoModel>> anuncios;

  SecaoModel({
    this.reference,
    this.nome,
    this.img,
    this.scrow,
    this.corR,
    this.corG,
    this.corB,
    this.corO,
    this.anuncios,
  });

  factory SecaoModel.fromDocument(
      DocumentSnapshot doc, Stream<List<PromoModel>> anuncios) {
    return SecaoModel(
      reference: doc.reference,
      nome: doc['nome'],
      img: doc['img'],
      scrow: doc['scrow'],
      corR: doc['corR'],
      corG: doc['corG'],
      corB: doc['corB'],
      corO: doc['corO'],
      anuncios: anuncios,
    );
  }

  @override
  String toString() {
    return " seção - $nome - anuncios $anuncios";
  }
}
