import 'package:cloud_firestore/cloud_firestore.dart';

class PromoModel {
  DocumentReference reference;
  String image;
  int prioridade;
  int produto;
  int x;
  int y;

  PromoModel({this.reference, this.image, this.prioridade, this.produto, this.x, this.y});

  PromoModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    prioridade = json['prioridade'];
    produto = json['produto'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['prioridade'] = this.prioridade;
    data['produto'] = this.produto;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }

  factory PromoModel.fromDocument(DocumentSnapshot doc) {
    return PromoModel(
      reference: doc.reference,
      image: doc['image'],
      prioridade: doc['prioridade'],
      produto: doc['produto'],
      x: doc['x'],
      y: doc['y'],
    );
  }

  @override
  String toString() {
    return " produto - $produto - x - $x - y - $y";
  }
}
