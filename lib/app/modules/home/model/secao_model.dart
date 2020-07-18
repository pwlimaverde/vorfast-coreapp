import 'package:cloud_firestore/cloud_firestore.dart';
import 'promo_model.dart';

class SecaoModel {
  DocumentReference reference;
  String nome;
  String img;
  bool scrow;
  int corr;
  int corg;
  int corb;
  double coro;
  Stream<List<PromoModel>> anuncios;

  SecaoModel({
    this.reference,
    this.nome,
    this.img,
    this.scrow,
    this.corr,
    this.corg,
    this.corb,
    this.coro,
    this.anuncios,
  });

  factory SecaoModel.fromDocument(
      DocumentSnapshot doc, Stream<List<PromoModel>> anuncios) {
    return SecaoModel(
      reference: doc.reference,
      nome: doc['nome'],
      img: doc['img'],
      scrow: doc['scrow'],
      corr: doc['corr'],
      corg: doc['corg'],
      corb: doc['corb'],
      coro: doc['coro'] + 0.0,
      anuncios: anuncios,
    );
  }

  @override
  String toString() {
    return " seção - $nome - anuncios $anuncios";
  }
}
